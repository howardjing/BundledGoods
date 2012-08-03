class Question < ActiveRecord::Base
  
  has_many :goods, :dependent => :destroy
  has_many :bundles, :dependent => :destroy
  has_one  :combo, :dependent => :destroy
  has_many :responses

  validates_uniqueness_of :number
  validates_numericality_of :number, :only_integer => true

  attr_accessor :number_of_goods
  validates_numericality_of :number_of_goods, :on => :create, :only_integer => true

  attr_accessor :number_of_bundles
  validates_numericality_of :number_of_bundles, :on => :create, :only_integer => true

  after_create :create_goods, :create_bundles, :create_combo

  STANDARD_DURATION = 60     # number of seconds for a standard question

  # ==== Methods ====

  def first?
    self.number == 0
  end

  def last?
    self.number == self.class.last.number
  end

  def next
    self.class.find_by_number(self.number + 1)
  end

  def previous
    self.class.find_by_number(self.number - 1)
  end

  def name
    "Question #{self.number}"
  end

  def bundles_and_combo
    bundles = self.bundles.to_a
    bundles << self.combo unless self.combo.nil?
    bundles
  end
  
  def find_bundle_given_goods(goods_set)
   
    goods_set = goods_set.to_set
    # empty set
    if goods_set.nil? || goods_set.empty?
      return nil
    end
    
    # have to do work
    chosen_bundle = nil;
    self.bundles.each do |bundle|
      goods = bundle.goods.to_set
      chosen_bundle = bundle if goods == goods_set
    end
    chosen_bundle
  end
  
  def menu_items
    goods = self.goods.to_a
    goods << combo unless combo.nil?
    goods
  end

  def millis_left(user_id)
    response = self.responses.find_by_user_id user_id

    time_passed = Time.now.in_time_zone - response.created_at

    duration = self.timed? ? response.duration : STANDARD_DURATION
    if response.duration > time_passed
      return (duration - time_passed) * 1000
    else
      return 0
    end
  end

  private
  def create_goods
    number = Integer(number_of_goods)
    if number > 0
      number.times do |i|
        utils = i+1
        good = self.goods.build(:number => utils, :price => 0, :value => utils)
        good.save
      end
    end
  end

  def create_bundles
    number = Integer(number_of_bundles)
    if number > 0
      number.times do |i|
        bundle = self.bundles.build(:number => (i+1), :lambda => 1)
        bundle.save
      end
    end
  end
  
  def create_combo
    combo = self.build_combo(:price => 0, :lambda => 1)
    combo.save
  end

end
