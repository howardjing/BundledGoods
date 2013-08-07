class OverallUser
  include User::Stats

  def cache_key
    "overall-user-#{QuestionStat.count}"
  end

  def name
    "Overall User"
  end

  def real_questions
    Question.real
  end

  %w(age year major gender).each do |attr|
    define_method(attr) do
      "N/A"
    end
  end
end