class Good < ActiveRecord::Base
  
  belongs_to :question
  has_one :combo, :through => :question

  has_and_belongs_to_many :bundles, :join_table => 'bundles_goods'

  validates_uniqueness_of :number, :scope => :question_id
  validates_numericality_of :number, :only_integer => true

  validates_numericality_of :price
  validates_numericality_of :value
  
  after_save :update_bundles_and_combo

  def name
    "Good #{number}"
  end
  
  def utility
    value - price
  end
  
  def lambda
    1.0
  end

  def bundles_and_combo
    everything = bundles.to_a
    everything << combo unless combo.nil?
    everything
  end

  def update_bundles_and_combo
    bundles_and_combo.each do |bundle|
      bundle.update_value_and_utility
      bundle.save!
    end
  end

end