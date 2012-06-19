class Question < ActiveRecord::Base
  
  has_many :goods, :dependent => :destroy
  has_many :question_responses
  
  validates_presence_of :content
  
  # ==== Methods ====
  delegate :url_helpers, to: 'Rails.application.routes' 
  def position
    Question.all.index(self)
  end
  
  def is_first?
    self.position == 0
  end
  
  def is_last?
    self.position == Question.count - 1
  end
  
  def next
    Question.all[self.position+1]
  end
  
  def previous
    Question.all[self.position-1]
  end
  
  def next_path
    self.is_last? ? url_helpers.pages_thanks_path : url_helpers.question_path(self.next)
  end
  
  def previous_path
    self.is_first? ? url_helpers.root_path : url_helpers.question_path(self.previous)
  end
  
  def name
    "Question " + (self.position+1).to_s
  end
    
    
  
end
