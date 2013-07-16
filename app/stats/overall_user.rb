class OverallUser
  include User::Stats

  def id
    "Average out of: #{User.count}"
  end

  def real_questions
    Question.real
  end

  def question_stats
    QuestionStat.includes(:question).find_all { |s| s.real? }
  end

  def optimal_answers
    real_questions.find_all { |q| q.optimal_answer? }
  end

  %w(age year major gender).each do |attr|
    define_method(attr) do
      "N/A"
    end
  end
end