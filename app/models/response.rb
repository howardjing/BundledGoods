class Response < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :question



  def self.final_answer(user_id, question_id)

  end

  
end
