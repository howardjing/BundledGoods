module PagesHelper

  def demo_question
    Question.find_by_number(0)
  end
  
  def chosen_answer(user_id, question_id) 
    answer = Response.final_answer user_id, question_id
    answer.nil? ? "Nothing" : answer.goods_names
  end
end
