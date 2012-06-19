class User < ActiveRecord::Base
  
  has_many :question_responses
  validates_presence_of :name
  
end
