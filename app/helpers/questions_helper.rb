module QuestionsHelper
  
  def menu_name(obj)
    "#{obj.menu_name}: Total value of #{obj.value - obj.price}" ## commented out {number_to_currency obj.price} for a total value of #{obj.value} utility - #{number_to_currency obj.price} = #{obj.value - obj.price}"
  end

  def next_path(question)
    question.last? ? edit_users_path : question_path(question.next)
  end

  def previous_path(question)
    question.first? ? instructions_path : question_path(question.previous)
  end

  def previous_url(question)
    question.first? ? instructions_url : question_url(question.previous)
  end
end
