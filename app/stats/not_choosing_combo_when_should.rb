class NotChoosingComboWhenShould 
  include User::Stats

  def misc_details
    details = {}
    details[:question_ids] = real_questions.map(&:id)
    details 
  end

  # GONNA DO THIS LATER
  # You did not choose combo even though the optimal bundle was combo AND your answer was not optimal
  def cache_key
    "not-choosing-combo-when-should-#{QuestionStat.count}"
  end

  def name
    "Not choosing combo when should"
  end

  def real_questions
    Question.joins(:instruction).real.find_all { |question|
      question.combo_optimal? && !question.chose_combo?
    }
  end

  %w(age year major gender).each do |attr|
    define_method(attr) do
      "N/A"
    end
  end


end