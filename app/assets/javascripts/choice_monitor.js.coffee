BundledGoods.choice_monitor = {
  init: (goodElement, comboElement) -> initialize(goodElement, comboElement)
}

good = null
combo = null
question = null

initialize = (goodElement, comboElement) ->
  good = goodElement
  combo = comboElement
  question = $('#question_id').data('questionId')
  
  good.on 'click', ->
    recordGood($(@))
  combo.on 'click', ->
    recordCombo($(@))
    
  
recordGood = (good) ->
  statement = "Good #{good.data('number')} was clicked. Value is now: #{good.is(':checked')}"
  #console.log statement
  record(statement)
  
recordCombo = (combo) ->
  statement = "Combo was clicked. Value is now: #{combo.is(':checked')}"
  #console.log statement
  record(statement)
  
record = (statement) ->
  $.ajax({
    type: 'POST',
    url: '/stats',
    data: { question_id: question, content: statement }
  })