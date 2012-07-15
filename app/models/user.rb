class User < ActiveRecord::Base
  
  has_many :responses
  validates_presence_of :name
  
end
