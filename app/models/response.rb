class Response < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :question


  # Returns the set of goods for the given user and question
  def self.final_answer(user_id, question_id)

    # Find which was was clicked last, Combo or Good
    # If it was Combo and true, then the final answer is Combo
    # Otherwise, loop through all of the goods associated with the question
    # then find the goods

    question = Question.find_by_id(question_id)
    puts "Self is: #{self.class}"
    latest_good = where("content LIKE 'Good%' AND user_id = ? AND question_id = ?", user_id, question_id).
        order("created_at DESC").limit(1)
    latest_combo = where("content LIKE 'Combo%' AND user_id = ? AND question_id = ?", user_id, question_id).
        order("created_at DESC").limit(1)

    if latest_good.empty? && latest_combo.empty?
      return nil
    elsif !latest_combo.empty? && latest_combo[0].content.include?('true')
      return question.combo
    else
      return self.find_chosen_goods(user_id, question)
    end
  end

  private
  def self.find_chosen_goods(user_id, question)
    chosen_goods = []

    question.goods.each do |good|
      good_decision = where("content LIKE 'Good_#{good.number}%' AND user_id = ? AND question_id = ?", user_id, question_id).
          order("created_at DESC").limit(1)
      unless good_decision.empty?
        if good_decision[0].content.include?('true')
          chosen_goods << good
        end
      end
    end

    return chosen_goods
  end

  
end
