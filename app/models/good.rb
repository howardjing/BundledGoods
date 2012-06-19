class Good < ActiveRecord::Base
  
  belongs_to :question
  validates_presence_of :price
  validates_presence_of :utility
  validates_presence_of :name
  
end