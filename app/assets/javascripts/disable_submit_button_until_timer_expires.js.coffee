BundledGoods.disable_submit_button_until_timer_expires = ->
  expired = $('#expired')
  
  unless isDemoQuestion()  
    if expired.val() == 'true'
      disableChoices()
    else
      disableSubmit()
    
    $(BundledGoods.timer).on 'expired', ->
      disableChoices()
    
disableChoices = ->
  $('[action="/experiment"] [type=checkbox]').attr 'disabled', true
  $('[action="/experiment"] [type=submit]').removeAttr 'disabled'
  
  # remove disabling of choices upon submit so they are submitted via post
  $('[action="/experiment"]').submit ->
    $('[action="/experiment"] [type=checkbox]').removeAttr 'disabled'

disableSubmit = ->
  $('[action="/experiment"] [type=checkbox]').removeAttr 'disabled'
  $('[action="/experiment"] [type=submit]').attr 'disabled', true
  

isDemoQuestion = ->
  $('#instructions_modal').data('demo') == true