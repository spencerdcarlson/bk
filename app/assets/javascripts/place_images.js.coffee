# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $('.popover-flag').popover()
  
  $('.has-whites').hover ->
    $(this).children('i').toggleClass('icon-white')
  
  $('.icon-thumbs-up').click ->
    console.log "Up Vote " + $(this).data('image-id')
    
  $('.icon-thumbs-down').click ->
    console.log "Down Vote " + $(this).data('image-id')
    
  $('.icon-flag').click ->
    console.log "Flag " + $(this).data('image-id')
    $('.popover-flag-close').live 'click', ->
      $('.popover-flag').popover('hide')
    
  
  
      
    