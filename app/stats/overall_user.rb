class OverallUser
  include User::Stats

  def id
    "Average out of: #{User.count}"
  end

  def real_questions
    Question.all
  end

  def question_stats
    QuestionStat.all
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