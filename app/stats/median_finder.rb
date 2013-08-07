class MedianFinder
  include User::Stats

  def initialize(name, statement)
    @statement = statement #user.average_time_between_statement_clicks
    @name = name.to_s
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

  def greater_than_median(sorted_array)
    cutoff = sorted_array.length / 2
    sorted_array.slice(cutoff, sorted_array.length)
  end

  def real_questions
    @real_questions ||= Question.where(user_id: greater_than_median(relevant_users).map(&:id)).real
  end

  %w(age year major gender).each do |attr|
    define_method(attr) do
      "N/A"
    end
  end
end