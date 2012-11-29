jQuery ->
  
  # toggling explanation
  $('.explanation').hide()

  $('.show-statement').click ->
    $(@).toggle()
    $(@).next().toggle()

  $('.explanation').click ->
    $(@).prev().toggle()
    $(@).toggle()
    
  # timer needs to be initialized before instructions
  # since instructions depends on timer
  BundledGoods.timer.init($('#timer'))
  BundledGoods.instructions.init($('#instructions_modal'))
  
  # toggle between goods and combo
  BundledGoods.choice_toggler($('[name=good_numbers\\[\\]]'), $('[name=combo]'))