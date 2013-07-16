class Instruction < ActiveRecord::Base
  attr_accessible :number, :content

  scope :real, lambda { where("instructions.number != 0") }
end
