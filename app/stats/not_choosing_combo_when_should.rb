class NotChoosingComboWhenShould 
  include User::Stats

  # GONNA DO THIS LATER
  # You did not choose combo even though the optimal bundle was combo AND your answer was not optimal
  def cache_key
    "not-choosing-combo-when-should-#{QuestionStat.count}"
  end

  def name
    "Not choosing combo when should"
  end

  def real_questions
    Question.joins(:instruction).where(instructions: { number: numbers }).real
  end

  %w(age year major gender).each do |attr|
    define_method(attr) do
      "N/A"
    end
  end
end