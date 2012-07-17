module ResponsesHelper

  def start_question(question_id)
    "Started question id: #{question_id}"
  end

  def end_question(question_id)
    "Ended question id: #{question_id}"
  end
  
  def begin_experiment(question_id)
    "Viewing instructions page start"
  end
end