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

  # ==== Methods ====
  delegate :url_helpers, to: 'Rails.application.routes'

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

  def next_path
    self.last? ? url_helpers.thanks_path : self.next
  end

  def previous_path
    self.first? ? url_helpers.instructions_path : self.previous
  end

  def name
    "Question #{self.number}"
  end

  def bundles_and_combo
    bundles = self.bundles.to_a
    bundles << self.combo unless self.combo.nil?
    bundles
  end

  private
  def create_goods
    number = Integer(number_of_goods)
    if number > 0
      number.times do |i|
        utils = i+1
        good = self.goods.build(:number => utils, :price => 0, :utility => utils)
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
