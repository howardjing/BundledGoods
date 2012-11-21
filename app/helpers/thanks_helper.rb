module ThanksHelper

def display_answer(question)
  if question.answer
    answer = question.answer.content['choice'].camelize
    answer += " " + question.answer.content['goods'].to_s if question.answer.content['choice'] == 'goods'
    answer
  end
end

end