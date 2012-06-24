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