hideExplanations = ->
  $('.show-statement').each (index, statement) ->
    statement = $(statement)
    explanation = statement.next()
    statement.show()
    explanation.hide()

jQuery ->
  
  # toggling explanation
  $('.explanation').hide()

  $('.show-statement').click ->
    
    statement = $(this)
    explanation = $(this).next()
    
    if statement.is ':visible'
      hideExplanations()
      statement.hide()
      explanation.show()
    else
      statement.show()
      explanation.hide()
      
  $('.explanation').click ->
    statement = $(this).prev()
    explanation = $(this)
    
    if explanation.is ':visible'
      statement.show()
      explanation.hide()
    else
      statement.hide()
      explanation.show()
    
  # hide timer if it should be hidden
  $('#timer_block').hide() if $('#timer_block').data('visible') == false
  $('#choose')
  
  # disable button
  BundledGoods.disable_submit_button_until_timer_expires()
  
  # timer needs to be initialized before instructions
  # since instructions depends on timer
  BundledGoods.timer.init($('#timer'))
  BundledGoods.instructions.init($('#instructions_modal'))
  
  # toggle between goods and combo
  BundledGoods.choice_toggler($('[name=good_numbers\\[\\]]'), $('[name=combo]'))
  
  # demo question
  BundledGoods.demo_question.init($('#demo_form'))
  
  # monitor menu clicks
  BundledGoods.menu_monitor.init($('.show-statement'), $('.explanation'))
  
  # monitor choice clicks
  BundledGoods.choice_monitor.init($('[name=good_numbers\\[\\]]'), $('[name=combo]'))