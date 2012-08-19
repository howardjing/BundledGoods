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

  STANDARD_DURATION = 1200     # number of seconds for a standard question

  # ==== Methods ====

  def demo?
    first?
  end
  
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

  def started?(user_id)
    user = User.find_by_id user_id
    if user.responses.blank?
      return false
    else
      return !(user.responses.find_by_question_id self.id).nil?
    end
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

    duration = self.random_duration? ? response.duration : self.duration
    if duration > time_passed
      return (duration - time_passed) * 1000
    else
      return 0
    end
  end

  # finds the current question number for a given user
  # this is defined to be the first unended question that a user has
  def self.current_question_number(user_id)
    current_user = User.find_by_id user_id
    if current_user.responses.empty?
      return 0
    end

    latest_response = current_user.responses.last
    if latest_response.end_time.nil?
      return latest_response.question.number
    else
      return latest_response.question.number + 1
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
