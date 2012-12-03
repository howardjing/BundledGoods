jQuery ->
  
  # toggling explanation
  $('.explanation').hide()

  $('.show-statement').click ->
    $(@).toggle()
    $(@).next().toggle()

  $('.explanation').click ->
    $(@).prev().toggle()
    $(@).toggle()
    
  # hide timer if it should be hidden
  $('#timer_block').hide() if $('#timer_block').data('visible') == false
  
  # timer needs to be initialized before instructions
  # since instructions depends on timer
  BundledGoods.timer.init($('#timer'))
  BundledGoods.instructions.init($('#instructions_modal'))
  
  # toggle between goods and combo
  BundledGoods.choice_toggler($('[name=good_numbers\\[\\]]'), $('[name=combo]'))
  
  # demo question
  BundledGoods.demo_question.init($('#demo_form'))