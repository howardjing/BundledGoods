module User::Stats
  def initially_chose_combo_count
    real_questions.find_all { |q| q.initial_selection == 'Combo' }.count
  end

  def finally_chose_combo_count
    real_questions.find_all { |q| q.answer_choice == 'Combo' }.count
  end

  def average_deviation_from_optimum(questions_to_compute = real_questions)
    (questions_to_compute.map(&:answer_deviation_from_optimum).sum.to_f / questions_to_compute.count).round(2)
  end

  def average_deviation_from_optimum_for_wrong_answers
    incorrect_questions = real_questions.find_all { |q| !q.optimal_answer? }
    average_deviation_from_optimum(incorrect_questions)
  end

  def average_answer_value
    (real_questions.map(&:answer_value).sum.to_f / real_questions.count).round(2)
  end

  def proportion_statements_clicked
    (total_distinct_statements_clicked_count.to_f / total_statements_count).round(2)
  end

  def total_distinct_statements_clicked_count
    real_questions.map(&:distinct_statements_clicked_count).sum
  end

  def total_statements_count
    real_questions.map(&:total_statements_count).sum
  end

  def question_stats
    QuestionStat.where(question_id: real_questions.map(&:id))
  end

  def optimal_answers
    real_questions.find_all { |q| q.optimal_answer? }
  end

  [:overall_time, :average_time_between_clicks,
    :average_time_between_statement_clicks,
    :average_time_between_selection_clicks].each do |statement|
    define_method statement do 
      questions = real_questions.find_all { |q| q.send(statement) != nil }
      if questions.count > 0
        (questions.map { |q| q.send(statement, precision: :default) }.sum / questions.count).round(2)
      end
    end
  end
end