jQuery ->
  
  # trigger this to start the experiment
  BundledGoods.experiment = {
    init: (options) -> init(options)
  }
  


questionPreviouslyStarted = null
secondsUntilIgnoringChoices = null
isDemo = null
# options:
#   started: whether or not this experiment has been previously started
#   ignoreChoicesAfter: seconds until we start ignoring choices the user makes
#   isDemo: true if question is a demo
init = (options) ->
  
  questionPreviouslyStarted = !!options.started
  secondsUntilIgnoringChoices = options.ignoreChoicesAfter || 300
  isDemo = !!options.isDemo
  
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
  # $('#timer_block').hide() if $('#timer_block').data('visible') == false
  
  # disable button
  disableChoicesWhenTimerExpires()
  
  ignoreChoicesAfter(secondsUntilIgnoringChoices)
  
  # initialize the timer and let server know that the user is starting this question
  initTimerAndStartQuestion($('#timer'))
  
  # toggle between goods and combo
  BundledGoods.choice_toggler($('[name=good_numbers\\[\\]]'), $('[name=combo]'))
  
  # demo question
  BundledGoods.demo_question.init($('#demo_form'))
  
  # monitor menu clicks
  BundledGoods.menu_monitor.init($('.show-statement'), $('.explanation'))
  
  # monitor choice clicks
  BundledGoods.choice_monitor.init($('[name=good_numbers\\[\\]]'), $('[name=combo]'))
  
hideExplanations = ->
  $('.show-statement').each (index, statement) ->
    statement = $(statement)
    explanation = statement.next()
    statement.show()
    explanation.hide()

ignoreChoicesAfter = (secondsUntilIgnoringChoices) ->
  unless isDemoQuestion()
    form = $('form')
    checkboxes = form.find('[type=checkbox]')
    checkboxValues = null
    menuOrCombo = $('.menu-or-combo')

    setTimeout ->
      checkboxValues = $.map checkboxes, (el) ->
        console.log('recording answers')
        $(el).is(':checked') 
    , (secondsUntilIgnoringChoices * 1000)
  
    # rechecking the values recorded in checkboxValues
    form.submit (e) ->
      menuOrCombo.css('visibility', 'hidden')
      if checkboxValues != null
        console.log('changing answers')
        $.map checkboxes, (el, i) ->
          $(el).prop('checked', checkboxValues[i])

disableChoicesWhenTimerExpires = ->
  expired = $('#expired')

  unless isDemoQuestion()  
    if expired.val() == 'true'
      disableChoices()

    $(BundledGoods.timer).on 'expired', ->
      disableChoices()

disableChoices = ->
  $('[action="/experiment"] [type=checkbox]').attr 'disabled', true
  $('[action="/experiment"] [type=submit]').removeAttr 'disabled'

  # remove disabling of choices upon submit so they are submitted via post
  $('[action="/experiment"]').submit ->
    $('[action="/experiment"] [type=checkbox]').removeAttr 'disabled'

isDemoQuestion = ->
  isDemo
  
initTimerAndStartQuestion = (timer) ->
  BundledGoods.timer.initAndStart(timer)
  unless questionPreviouslyStarted
    sendQuestionStarted (new Date()).toString()

sendQuestionStarted = (timeStart) ->
  $.ajax {
    type: 'POST'
    url: '/experiment/start_question'
    data: { start_time: timeStart }
  }
  
  