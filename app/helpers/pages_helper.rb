module PagesHelper

  def demo_question
    Question.find_by_number(0)
  end
end
