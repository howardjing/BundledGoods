class Question < ActiveRecord::Base
  
  has_many :goods, :dependent => :destroy
  has_many :bundles, :dependent => :destroy
  has_many :question_responses

  validates_presence_of :number
  validates_uniqueness_of :number
  validates_numericality_of :number, :only_integer => true

  attr_accessor :number_of_goods
  validates_presence_of :number_of_goods, :on => :create
  validates_numericality_of :number_of_goods, :on => :create, :only_integer => true

  attr_accessor :number_of_bundles
  validates_presence_of :number_of_bundles, :on => :create
  validates_numericality_of :number_of_bundles, :on => :create, :only_integer => true

  after_create :create_goods, :create_bundles

  # ==== Methods ====
  delegate :url_helpers, to: 'Rails.application.routes'

  def is_first?
    self.number == 0
  end

  def is_last?
    self.number == self.class.count - 1
  end

  def next
    self.class.find_by_number(self.number + 1)
  end

  def previous
    self.class.find_by_number(self.number - 1)
  end

  def next_path
    self.is_last? ? url_helpers.thanks_path : self.next
  end

  def previous_path
    self.is_first? ? url_helpers.instructions_path : self.previous
  end

  def name
    "Question #{self.number}"
  end

  private
  def create_goods
    number = Integer(number_of_goods)
    number.times do |i|
      good = self.goods.build(:number => (i+1), :price => 0, :utility => 0)
      good.save
    end
  end

  def create_bundles
    number = Integer(number_of_bundles)
    number.times do |i|
      bundle = self.bundles.build(:name => "Bundle #{i+1}", :lambda => 1)
      bundle.save
    end
  end
    
    
  
end
