class Bundle < ActiveRecord::Base
  include GoodsModule

  belongs_to :question
  has_and_belongs_to_many :goods, :join_table => 'bundles_goods'

  validates_presence_of :number
  validates_numericality_of :number, :only_integer => true
  validates_uniqueness_of :number, :scope => :question_id

  validates_presence_of :lambda
  validates_numericality_of :lambda

  validates_format_of :goods_list, :with => /^([0-9]+,?\s*)+$/      # ie num, num,

  validates_numericality_of :value
  validates_numericality_of :utility

  after_validation :add_goods, :update_value_and_utility
  attr_accessor :goods_list

  def name
    "Bundle #{self.number}"
  end

  def goods_numbers
    self.goods.map(&:number).join(', ')
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

  def update_value_and_utility
    sum_goods_utility = self.goods.map(&:utility).reduce(0,:+)
    sum_goods_price = self.goods.map(&:price).reduce(0,:+)
    self.value = self.lambda * sum_goods_utility
    self.utility = self.value - sum_goods_price
    self.save(:validate => false)
  end



end
