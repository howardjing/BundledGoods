class Response < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :question

  # Returns the set of goods for the given user and question
  def self.final_answer(user_id, question_id)
    
    # puts "Userid: #{user_id}, Questionid: #{question_id}"
    
    # Find which was was clicked last, Combo or Good
    # If it was Combo and true, then the final answer is Combo
    # Otherwise, loop through all of the goods associated with the question
    # then find the goods

    question = Question.find_by_id(question_id)
    last_good_response = where("content LIKE 'Good%' AND user_id = ? AND question_id = ?", user_id, question_id).
                    order("created_at DESC").limit(1).first
    last_combo_response = where("content LIKE 'Combo%' AND user_id = ? AND question_id = ?", user_id, question_id).
                    order("created_at DESC").limit(1).first

    # puts "last good: #{last_good_response}"
    # puts "last combo: #{last_combo_response}"
    
    # if there are no results, then the answer is empty
    if last_good_response.nil? && last_combo_response.nil?
      return nil
    end
    
    # get the candidates
    combo_candidate = (!last_combo_response.nil? && last_combo_response.content.include?('true')) ? question.combo : nil
    bundle_candidate = (!last_good_response.nil?) ? self.find_chosen_bundle_or_good(user_id, question) : nil

    # puts "combo candidate: #{combo_candidate}"
    # puts "bundle candidate: #{bundle_candidate}"
    
    # return the appropriate candidate
    if combo_candidate.nil? && bundle_candidate.nil?  # this case is necessary in case user made selection
      return nil                                      # but later deselected answer
    elsif combo_candidate.nil? && !bundle_candidate.nil?
      return bundle_candidate if last_good_response > last_combo_response
    elsif !combo_candidate.nil? && bundle_candidate.nil?
      return combo_candidate if last_combo_response > last_good_response
    else
      return last_combo_response > last_good_response ? combo_candidate : bundle_candidate
    end
  end
  
  include Comparable
  def <=>(y)
    if y.nil? || self.created_at > y.created_at
      1
    elsif self.created_at < y.created_at
      -1
    else
      0
    end
  end

  private

  # returns nil, the chosen bundle, or the chosen good
  def self.find_chosen_bundle_or_good(user_id, question)
    goods_set = self.find_chosen_goods_set(user_id, question)
    goods_set.size == 1 ? goods_set.first : question.find_bundle_given_goods(goods_set)
  end
  
  def self.find_chosen_goods_set(user_id, question)
    chosen_goods = Set.new

    question.goods.each do |good|
      good_decision = where("content LIKE 'Good_#{good.number}%' AND user_id = ? AND question_id = ?", user_id, question.id).
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
