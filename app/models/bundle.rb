class Bundle < ActiveRecord::Base
  include GoodsModule

  belongs_to :question
  has_and_belongs_to_many :goods, :join_table => 'bundles_goods'

  validates_numericality_of :number, :only_integer => true
  validates_uniqueness_of :number, :scope => :question_id

  validates_numericality_of :lambda

  validates_format_of :goods_list, :with => /^([0-9]+,?\s*)+$/, :allow_nil => true      # ie num, num,

  validates_numericality_of :value, :allow_nil => true
  validates_numericality_of :utility, :allow_nil => true

  before_save :add_goods, :update_value_and_utility
  attr_accessor :goods_list

  def name
    "Bundle #{self.number}"
  end
  
  def price
    goods.map(&:price).reduce(0,:+)
  end
  
  private
  def add_goods
    if !goods_list.blank? && goods_list != goods_numbers

      possible_goods = self.question.goods
      self.goods.clear

      goods = goods_list.split(',')
      goods_set = Set.new
      goods.each do |good_number|
        good = possible_goods.find_by_number(good_number)
        goods_set.add(good) if !good.nil?
      end
      self.goods = goods_set.to_a
    end
  end

end
