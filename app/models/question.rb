class Question < ActiveRecord::Base
  
  #validates_presence_of :user
  belongs_to :user
  belongs_to :instruction
  
  has_one :next_question, class_name: 'Question', foreign_key: 'previous_question_id'
  belongs_to :previous_question, class_name: 'Question'
  
  has_many :question_stats
  
  has_one :answer
  alias_attribute :goods, :values
    
  validates_presence_of :instruction
  
  delegate :number, to: :instruction
  
  # the values and bundle_effects of the various goods
  serialize :values, JSON
  serialize :effects, JSON
  
  def instructions
    instruction.content
  end    
  
  def first_question?
    previous_question.nil?
  end

  def last_question?
    next_question.nil?
  end
  
  def started?
    !time_started.nil?
  end
  
  def time_remaining
    [duration - seconds_since_started, 0].max
  end
  
  def expired?
    time_remaining == 0
  end
  
  def name
    "Question #{number}"
  end
  
  def demo?
    number == 0
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
    options[:effect_range] ||= [-4,4]

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
  
  def combo_noeffect  #this will go in the menu
  	goods.values.reduce(1, :+)
  end
  
  def combo_witheffect #this will be the "solution" final value
    # (sum of goods + 1)
    combo_noeffect + effects[goods.keys.map{ |key| key.to_i}.to_s]
  end
  
  def bundle(choices)
    # (sum of effects + sum of goods values)
    (effects[choices.to_s] || 0) + choices.map{ |i| goods[i.to_s] }.reduce(0, :+)
  end
  
  def optimal_value
    max = -99999 # really small number
    
    # brute force hacky solution
    each_bundle do |b|
      if max < bundle(b)
        max = bundle(b)
      end
    end
    
    if max < combo_witheffect
      max = combo_witheffect
    end
    
    max
  end
  
  def each_bundle
    combinations = 1.upto(goods.size).flat_map { |n| 
      goods.keys.map(&:to_i).combination(n).to_a
    }
    
    combinations.each do |combination|
      yield(combination)
    end
  end
  
  private
  
  def seconds_since_started
    if started?
      (Time.zone.now - time_started).to_i
    else
      0
    end
  end
  
end
