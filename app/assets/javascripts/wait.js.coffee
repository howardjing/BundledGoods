jQuery ->
  
  # options: 
  #   expired: whether or not this timer has already expired
  # trigger this to start the waiting process
  BundledGoods.wait = {
    init: (options) -> init(options)
  }
  
init = (options) ->
  
  timerExpired = !!options.expired 
  continueLink = $('.continue')
  
  continueLink.on 'click', (e) ->
    e.preventDefault() unless timerExpired 
  

  BundledGoods.timer.initAndStart($('#timer'))
  $(BundledGoods.timer).on 'expired', ->
    timerExpired = true
    removeDisabledButtonStyle(continueLink)
    
  unless timerExpired
    addDisabledButtonStyle(continueLink)
    
addDisabledButtonStyle = (el) ->
  el.addClass('disabled')

removeDisabledButtonStyle = (el) ->
  el.removeClass('disabled')