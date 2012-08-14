class Combo < ActiveRecord::Base
  include GoodsModule
  
  belongs_to :question

  validates_presence_of :price
  validates_numericality_of :price

  validates_presence_of :lambda
  validates_numericality_of :lambda

  validates_numericality_of :value, :allow_nil => true
  validates_numericality_of :utility, :allow_nil => true

  before_save :update_value_and_utility
  
  def name
    "Combo Package"
  end
  
  def sum_goods_price
    self.price
  end
  
  def goods
    # puts "The values are: #{self.question.goods.map(&value)}" 
    goods = self.question.goods
    goods.each do |good|
      puts "the value was #{good.value}"
      good.value = good.number * 2
      puts "the value is now #{good.value}"
    end 
    goods
  end

  def menu_name
    "#{name} consisting of #{shuffled_goods_names}"
  end
end
