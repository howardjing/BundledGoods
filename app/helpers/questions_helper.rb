module QuestionsHelper
  
  def menu_name(obj)
    "#{obj.menu_name}: #{number_to_currency obj.price}"
  end

  def next_path(question)
    question.last? ? edit_user_path : question_path(question.next)
  end

  def previous_path(question)
    question.first? ? instructions_path : question_path(question.previous)
  end

  def next_url(question)
    question.last? ? edit_user_url : question_url(question.next)
  end

  def previous_url(question)
    question.first? ? instructions_url : question_url(question.previous)
  end
end
