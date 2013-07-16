class OverallQuestion
  include User::Stats

  # an array of numbers to include
  attr_reader :numbers

  def initialize(numbers)
    @numbers = numbers
  end

  def cache_key
    "overall-question-#{QuestionStat.count}"
  end

  def name
    "Question range: #{numbers}"
  end

  def real_questions
    Question.joins(:instruction).where(instructions: { number: numbers }).real
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