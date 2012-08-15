class User < ActiveRecord::Base
  
  has_many :responses
  validates_presence_of :lab_number, :on => :create
  
  def calculate_final_score_deprecated
    score = 0
    questions = Question.all.to_a
    questions.delete(Question.first) # ignore the demo question
    puts "Calculating the final score for #{questions.size} questions"
    questions.each do |question|
      final_answer = self.final_answer question.id
      score += final_answer.utility unless final_answer.nil?
    end
    score.round
  end

  def calculate_final_score
    chosen_question = rand(Question.count - 1) + 1
    puts "The chosen question is: #{chosen_question}"
    question = Question.find_by_number chosen_question
    
    score = 0
    final_answer = self.final_answer question.id
    score += final_answer.utility unless final_answer.nil?
    puts "the unrounded score is: #{score}"
    score.round 
  end

  
  # returns either nil, the combo, the bundle, or the single good
  def final_answer(question_id)

    response = self.responses.find_by_question_id question_id

    # Case 1: no response for this question or no answers
    return nil if response.nil? || response.answers.empty?

    puts "Computing the final answer for question: #{response.question.name}"

    # Otherwise get the last chronological answer
    answer = response.answers.last
    
    if answer.good? 
      return handle_last_answer_was_good response
    elsif answer.combo?
      return handle_last_answer_was_combo response
    end
  end
  
  private
 
  # Returns either a single good, or the bundle
  def handle_last_answer_was_good(response)
    puts "handling last good for question: #{response.question.name}"
    # the chosen_goods set is the set of selected goods
    chosen_goods = find_chosen_goods_set(response)
    puts "The chosen goods were: #{chosen_goods.map(&:name)}"
    if chosen_goods.size == 1
      return chosen_goods.first
    else
      return response.question.find_bundle_given_goods(chosen_goods)
    end
  end
  
  # Returns the combo if it was selected
  def handle_last_answer_was_combo(response)
    return response.answers.last.selected? ? response.question.combo : nil
  end

  # Returns the set of selected goods contained in the response
  def find_chosen_goods_set(response)

    # find the last time combo happened
    latest_combo = nil
    response.answers.each do |answer|
      if answer.combo? && (latest_combo.nil? || answer.created_at > latest_combo.created_at)
        latest_combo = answer
      end
    end

    # find the relevant set of answers
    answers = response.answers.find_all do |answer|
        answer.good? && (latest_combo.nil? ? true : (answer.created_at > latest_combo.created_at))
    end

    good_answers = {}
    answers.each do |answer|
      if answer.good?
        if good_answers.include? answer.good
          # update the hash if the current answer is more current
          good_answers[answer.good] = answer if answer.more_current? good_answers[answer.good] 
        else
          good_answers[answer.good] = answer
        end
      end
    end

    # return only the selected goods
    if good_answers.empty? 
      return good_answers.keys
    else
      return good_answers.select { |good, answer| answer.selected? }.keys
    end
  end

end
