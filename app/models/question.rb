class Question < ActiveRecord::Base
  
  #validates_presence_of :user
  belongs_to :user
  
  has_one :next_question, class_name: 'Question', foreign_key: 'previous_question_id'
  belongs_to :previous_question, class_name: 'Question'
  
  has_one :answer
  alias_attribute :goods, :values
    
  # the values and bundle_effects of the various goods
  serialize :values, JSON
  serialize :effects, JSON
  
  def first_question?
    previous_question.nil?
  end
  
  def last_question?
    next_question.nil?
  end
  
  def number
    # too lazy to add number column to questions table, doing it recursively
    # most likely slow as hell
    if first_question?
      0
    else
      previous_question.number + 1
    end
  end
  
  # Use this function to generate a random question
  # options are: 
  
  # For generating goods:
  # number_of_goods, the number of goods this question will have. The default is 4 (must be >= 2)
  # value_range, the value range each good will provide. The default is [0,2] (integer)
  # effect_range, the additive bundle effect each good will provide. The default is [-3,3] (integer)

  # This function does not populate the following values:
  # user, previous_question, duration
  # so additional setup is necessary to create a valid question
  def self.generate_random(options = {})
    options[:number_of_goods] ||= 4
    options[:value_range] ||= [0,2]
    options[:effect_range] ||= [-3,3]

    # generate random values
    values = {} # this could be an array but effects is a hash so I'm making this a hash as well
    goods = (1..options[:number_of_goods]).to_a
    goods.each do |good|
      values[good] = Random.rand(options[:value_range].first .. options[:value_range].last)
    end
    
    # generate random effects
    effects = {}
    goods_combinations = 2.upto(goods.length).flat_map { |n| goods.combination(n).to_a } # set of subsets from length 2 to n
    
    goods_combinations.each do |combo|
      effects[combo] = Random.rand(options[:effect_range].first .. options[:effect_range].last)
    end
    
    question = new
    question.values = values
    question.effects = effects
    
    question
  end
  
  def combo
    # (sum of goods + 1)
    goods.values.reduce(1, :+) + effects[goods.keys.map{ |key| key.to_i}.to_s]
  end
  
  def bundle(choices)
    # (sum of effects + sum of goods values)
    (effects[choices.to_s] || 0) + choices.map{ |i| goods[i.to_s] }.reduce(0, :+)
  end
  
end
