class User < ActiveRecord::Base
  
  has_many :responses
  validates_presence_of :name
  
  def calculate_final_score
    score = 0
    questions = Question.all.to_a
    questions.delete(Question.first)
    questions.each do |question|
      final_answer = Response.final_answer(self.id, question.id)
      score += final_answer.utility unless final_answer.nil?
    end
    score.round
  end
  
end
