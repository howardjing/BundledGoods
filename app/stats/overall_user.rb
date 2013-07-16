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

  def question_stats
    QuestionStat.where(question_id: real_questions.pluck(:id))
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