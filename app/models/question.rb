class Question < ActiveRecord::Base
  
  # Publicly, all questions have a time limit of 300 seconds
  # all questions also have an internal time limit which can be accessed with
  # Question#duration. The duration is set in User#generate_questions
  PUBLIC_TIME_LIMIT = 300
  
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
  
  # options[:private] defaults to false
  # if private is true, then the time remaining for the internal time limit is returned
  # otherwise the time remaining for the public time limit is returned
  def time_remaining(options = {})
    options[:private] ||= false
    
    if options[:private]
      [duration - seconds_since_started, 0].max
    else
      [PUBLIC_TIME_LIMIT - seconds_since_started, 0].max
    end
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
  
  def has_answer?
  	!answer.nil?
  end

  def answer_value
  	answer.value if has_answer?
  end
  
  def optimal_answer?
  	has_answer? && answer_value == optimal_value
  end
  
  def answer_deviation_from_optimum
  	optimal_value - answer_value if has_answer?
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
  
  def seconds_between_clicks(stats)
    first_actions = stats.slice(0, stats.length-1)
  	second_actions = stats.slice(1, stats.length)
  	second_actions.zip(first_actions).map { |second, first| second.created_at - first.created_at }
  end

  def print_question_stats(ordered_question_stats)
  	puts "time between every click: #{seconds_between_clicks(ordered_question_stats).join(" seconds, ")}"
  	puts "time between every show click: #{seconds_between_clicks(ordered_question_stats.find_all { |s| s.content.include?("shown") }).join(" seconds, ")}"
  	puts "time between every good click: #{seconds_between_clicks(ordered_question_stats.find_all { |s| s.content.include?("clicked") }).join(" seconds, ")}"
  end
  
  def print_question_stats(stats)
	everything = seconds_between_clicks(ordered_question_stats)
	puts "time between every click: #{everything.join(" seconds, ")}"
	puts "average time between click: #{average_between_clicks(everything)}"
	shown_goods = seconds_between_clicks(ordered_question_stats.find_all { |s| s.content.include?("shown") })
	puts "time between every show click: #{shown_goods.join(" seconds, ")}"
	puts "average time between click: #{average_between_clicks(shown_goods)}"
	answered_goods = seconds_between_clicks(ordered_question_stats.find_all { |s| s.content.include?("clicked") })
	puts "time between every good click: #{answered_goods.join(" seconds, ")}"
	puts "average time between click: #{average_between_clicks(answered_goods)}"
  end
  
  def average_between_clicks(seconds)
  	seconds.sum / seconds.length
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
