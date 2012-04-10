class Survey < ActiveRecord::Base
  
  has_many :questions, :dependent => :destroy
  has_many :survey_responses
  
  validates_presence_of :name
  
  
  # ==== Methods ====
  def first_question
    self.questions.first
  end
end
