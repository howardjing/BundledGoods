class Bundle < ActiveRecord::Base

  belongs_to :question
  has_and_belongs_to_many :goods, :join_table => 'bundles_goods'

  validates_presence_of :name

  validates_presence_of :lambda
  validates_numericality_of :lambda

  after_save :add_goods
  attr_accessor :goods_list

  def goods_names
    self.goods.map(&:name)
  end

  private
  def add_goods
    if !goods_list.blank? && goods_list != self.goods.map(&:number).join(',')
      possible_goods = self.question.goods
      goods = goods_list.split(',')
      goods.each do |good_number|
        good = possible_goods.find_by_number(good_number)
        self.goods.push(good)
      end
    end
  end

end
