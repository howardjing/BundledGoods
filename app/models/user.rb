class User < ActiveRecord::Base
  
  has_many :responses
  validates_presence_of :name
  
  def calculate_final_score
    score = 0
    Question.all.each do |question|
      final_answer = Response.final_answer(self.id, question.id)
      score += final_answer.utility unless final_answer.nil?
    end
    score
  end
  
end
