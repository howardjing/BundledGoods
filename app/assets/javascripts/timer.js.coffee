BundledGoods.timer = {
  init: (timerElement) -> initializeTimer(timerElement)
  start: -> tick()
}

timer = null
secondsRemaining = null

initializeTimer = (timerElement) ->
  timer = timerElement
  secondsRemaining = timer.data('seconds')
  updateSeconds()

updateSeconds = ->
  if secondsRemaining >= 0
    minutes = Math.floor(secondsRemaining / 60)
    seconds = secondsRemaining % 60
    timer.text(doubleDigits(minutes) + ":" + doubleDigits(seconds))

tick = ->
  if secondsRemaining > 0
    secondsRemaining -= 1
    updateSeconds()
    setTimeout (-> tick()), 1000
  else
    $(BundledGoods.timer).trigger('expired')
      
doubleDigits = (number) ->
  if Math.abs(number) < 10
    '0' + number;
  else
    number