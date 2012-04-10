class Question < ActiveRecord::Base
  
  has_many :answers, :dependent => :destroy
  has_many :question_responses
  belongs_to :survey
  
  validates_presence_of :content
  
  # ==== Methods ====
  delegate :url_helpers, to: 'Rails.application.routes' 
  def position
    self.survey.questions.index(self)
  end
  
  def is_first?
    self.position == 0
  end
  
  def is_last?
    self.position == self.survey.questions.count - 1
  end
  
  def next
    self.survey.questions[self.position+1]
  end
  
  def previous
    self.survey.questions[self.position-1]
  end
  
  def next_path
    self.is_last? ? url_helpers.pages_thanks_path : url_helpers.survey_question_path(self.survey, self.next)
  end
  
  def previous_path
    self.is_first? ? url_helpers.survey_path(self.survey) : url_helpers.survey_question_path(self.survey, self.previous)
  end
  
  def name
    "Question " + (self.position+1).to_s
  end
    
    
  
end
