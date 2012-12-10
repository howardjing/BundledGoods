BundledGoods.menu_monitor = {
  init: (showElement, hideElement) -> initializeMenu(showElement, hideElement)
}

show = null
hide = null
question = null

initializeMenu = (showElement, hideElement) ->
  show = showElement
  hide = hideElement
  question = $('#question_id').data('questionId')
  
  show.on 'click', ->
    recordShown($(@).data('bundle'))
    
  hide.on 'click', ->
    recordHidden($(@).data('bundle'))
    
recordShown = (bundle) ->
  statement = "Menu item was shown: bundle #{bundle}"
  # console.log statement
  record(statement)
  
recordHidden = (bundle) ->
  statement = "Menu item was hidden: bundle #{bundle}"
  # console.log statement
  record(statement)
  
record = (statement) ->
  $.ajax({
    type: 'POST',
    url: '/stats',
    data: { question_id: question, content: statement }
  })