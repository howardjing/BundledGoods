class Combo < ActiveRecord::Base
  include GoodsModule
  
  belongs_to :question

  delegate :goods, :to => :question

  validates_presence_of :price
  validates_numericality_of :price

  validates_presence_of :lambda
  validates_numericality_of :lambda

  validates_numericality_of :value, :allow_nil => true
  validates_numericality_of :utility, :allow_nil => true

  before_save :update_value_and_utility
  
  def name
    "All Inclusive Bundle"
  end
  
  def sum_goods_price
    self.price
  end

end