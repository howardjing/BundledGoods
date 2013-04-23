class QuestionStat < ActiveRecord::Base

  belongs_to :question
  validates_presence_of :question
  
  def user
    question.user
  end

end
