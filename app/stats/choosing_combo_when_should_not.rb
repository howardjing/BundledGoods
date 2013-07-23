class ChoosingComboWhenShouldNot
  include User::Stats

  def misc_details
    details = {}
    details[:question_ids] = real_questions.map(&:id)
    details[:total_times_combo_chose] = total_times_chose_combo
    details[:proportion_incorrectly_chose_combo] = (real_questions.count.to_f / total_times_chose_combo).round(3)
    details 
  end

  # Your final answer was combo, AND the optimal answer was not combo
  def cache_key
    "choosing-combo-when-should-not-#{QuestionStat.count}"
  end

  def name
    "Choosing combo when should not"
  end

  def real_questions
    @real_questions ||= Question.joins(:instruction).real.find_all { |question|
      !question.combo_optimal? && question.chose_combo?
    }
  end

  def question_stats
    QuestionStat.where(question_id: real_questions.map(&:id))
  end

  def optimal_answers
    real_questions.find_all { |q| q.optimal_answer? }
  end

  %w(age year major gender).each do |attr|
    define_method(attr) do
      "N/A"
    end
  end

  private

  def total_times_chose_combo
    @total_times_chose_combo = Question.all.find_all { |q| q.chose_combo? }.count
  end
end