BundledGoods.demo_question = {
  init: (demoFormElement) -> initializeDemoForm(demoFormElement)
  start: -> tick()
}

demoForm = null
submit = null
totalQuestions = null

initializeDemoForm = (demoFormElement) ->
  demoForm = demoFormElement
  submit = $('button[type=submit]')
  totalQuestions = demoForm.find('input[type=text]').size()
  validateAnswerListener()
  
  submit.on 'disable', ->
    preventSubmit()
  submit.on 'enable', ->
    enableSubmit()
  
#   submit.trigger('disable') if demoForm.size() > 0


validateAnswerListener = ->
  demoForm.find('input[type=text]').blur ->
    
    controlGroup = $(@).closest('.control-group')
    if answerIsCorrect($(@).data('answer'), $(@).val())
      $(@).siblings('span').text('good job')  
      controlGroup.removeClass('error')
      controlGroup.addClass('success')
      submit.trigger('enable') if everythingCorrect()
        
    else
      $(@).siblings('.help-inline').text('try again')
      controlGroup.removeClass('success')
      controlGroup.addClass('error')
#       submit.trigger('disable')

answerIsCorrect = (answer, input) ->
  parseInt(answer) == parseInt(input)
  
everythingCorrect = ->
  $('.control-group.success').size() == totalQuestions

preventSubmit = ->
  submit.attr('disabled', '')

enableSubmit = ->
  submit.removeAttr('disabled')