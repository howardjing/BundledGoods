class User < ActiveRecord::Base
  
  has_many :survey_responses
  validates_presence_of :name
  
end
