jQuery.fn.flashExitListen = ->
  $('#flash-exit').hover ->
    $(this).toggleClass "icon-remove-sign"
  $('#flash-exit').click ->
    console.log "click"
    $('#flash').toggleClass "hide"

jQuery ->
  $('.flash').flashExitListen()
  if $("#flashWrap").is(":empty")
    console.log 'Empty'

    
  