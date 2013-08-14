class PercentileFinder
  include User::Stats

  attr_reader :questions, :start_percentile, :end_percentile

  # 6 questions total
  def initialize(name, statement, questions=[1,2,4,5,6], start_percentile=50, end_percentile=100)
    @statement = statement #user.average_time_between_statement_clicks (lambda)
    @name = name.to_s
    @questions = questions
    @start_percentile = start_percentile
    @end_percentile = end_percentile
  end

  def name
    @name
  end

  def cache_key
    "#{name.downcase.gsub(' ', '-')}-numbers-#{questions}-from-#{start_percentile}-to-#{end_percentile}-#{QuestionStat.count}"
  end
  
  def relevant_users
    @relevant_users ||= User.includes(:questions).includes(:question_stats).scoped.sort! { |a,b|
      user1 = @statement.call(a) || 0
      user2 = @statement.call(b) || 0
      user1 <=> user2
    }
  end

  def within_percentile(sorted_array)
    start_point = (sorted_array.length * (start_percentile/100.0)).ceil
    end_point = (sorted_array.length * (end_percentile/100.0)).ceil
    sorted_array.slice(start_point, end_point)
  end

  def real_questions
    @real_questions ||= Question
      .where(user_id: within_percentile(relevant_users).map(&:id))
      .joins(:instruction).where(instructions: { number: questions })
      .real
  end

  %w(age year major gender).each do |attr|
    define_method(attr) do
      "N/A"
    end
  end
end