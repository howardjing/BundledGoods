class PercentileFinder
  include User::Stats

  attr_reader :start_percentile, :end_percentile

  def initialize(start_percentile, end_percentile, name, statement)
    @statement = statement #user.average_time_between_statement_clicks (lambda)
    @name = name.to_s
    @start_percentile = start_percentile
    @end_percentile = end_percentile
  end

  def name
    @name
  end

  def cache_key
    "#{name.downcase.gsub(' ', '-')}-#{QuestionStat.count}"
  end
  
  def relevant_users
    @relevant_users ||= User.includes(:questions).includes(:question_stats).scoped.sort! { |a,b|
      user1 = @statement.call(a) || 0
      user2 = @statement.call(b) || 0
      user1 <=> user2
    }
  end

  def within_percentile(sorted_array)
    start_point = (sorted_array.length * start_percentile).ceil
    end_point = (sorted_array.length * end_percentile).ceil
    sorted_array.slice(start_point, end_point)
  end

  def real_questions
    @real_questions ||= Question.where(user_id: within_percentile(relevant_users).map(&:id)).real
  end

  %w(age year major gender).each do |attr|
    define_method(attr) do
      "N/A"
    end
  end
end