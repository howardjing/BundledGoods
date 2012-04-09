class Survey < ActiveRecord::Base
  
  has_many :questions, :dependent => :destroy
  validates_presence_of :name
  
  def first_question
    self.questions.first
  end
end
