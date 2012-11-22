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
  $('.toggle-white').hover ->
    $(this).toggleClass('icon-white')
  $('.toggle-remove').hover ->
    $(this).toggleClass('icon-remove-sign')
    
  