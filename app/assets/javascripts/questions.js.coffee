# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


jQuery ->
  $('.explanation').hide()

  $('.show-statement').click ->
    $(@).toggle()
    $(@).next().toggle()

  $('.explanation').click ->
    $(@).prev().toggle()
    $(@).toggle()

#  timer 60*5


timer = (secondsRemaining) ->
  if secondsRemaining >= 0
    minutes = Math.floor secondsRemaining / 60
    seconds = secondsRemaining % 60

    # update text
    $('#timer').text (doubleDigits minutes) + ':' + (doubleDigits seconds)

    if secondsRemaining > 0
      secondsRemaining--
      setTimeout (-> timer secondsRemaining), 1000

doubleDigits = (number) ->
  if (Math.abs number) < 9
    '0' + number
  else
    number
