BundledGoods.instructions = {
  init: (instructionsModal) -> init(instructionsModal)
}

instructions = null

init = (instructionsModal) ->
  instructions = instructionsModal 
  questionStarted = instructions.data('started')
  
  # $(BundledGoods.timer).on 'expired', ->
  #   sendQuestionEnded() unless isDemoQuestion() # only submit if not the demo
    
  if questionStarted    
    resumeQuestion()
  else
    startNewQuestion()
    


startNewQuestion = ->
  instructions.modal()
  instructions.on 'hidden', ->
    BundledGoods.timer.start()
    sendQuestionStarted (new Date()).toString()

resumeQuestion = ->
  BundledGoods.timer.start()


sendQuestionStarted = (timeStart) ->
  $.ajax {
    type: 'POST'
    url: '/experiment/start_question'
    data: { start_time: timeStart }
  }
  
sendQuestionEnded = ->
  $('#expired').val('true')
  $('button[type=submit]').click()

isDemoQuestion = ->
  instructions.data('demo') == true