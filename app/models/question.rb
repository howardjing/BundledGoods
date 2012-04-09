class Question < ActiveRecord::Base
  
  has_many :answers, :dependent => :destroy
  belongs_to :survey
  
  validates_presence_of :content
end
