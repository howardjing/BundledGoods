module PagesHelper

  def demo_question
    Question.find_by_number(0)
  end
  
  def chosen_answer(question_id) 
    answer = current_user.final_answer question_id
    answer.nil? ? "Nothing" : "#{answer.name}: #{answer.goods_names}"
  end
end
