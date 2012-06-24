class Good < ActiveRecord::Base
  
  belongs_to :question
  has_and_belongs_to_many :bundles, :join_table => 'bundles_goods'

  validates_presence_of :number
  validates_uniqueness_of :number, :scope => :question_id
  validates_numericality_of :number, :only_integer => true

  validates_presence_of :price
  validates_numericality_of :price

  validates_presence_of :utility
  validates_numericality_of :utility

  def name
    "Good #{number}"
  end

  
end