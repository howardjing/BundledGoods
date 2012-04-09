class Answer < ActiveRecord::Base
  
  belongs_to :question
  validates_presence_of :content
  
  # ==== Methods ====
  def position
    self.question.answers.index(self)
  end
  def name
    "Answer " + (self.position + 1).to_s
  end
  
end
