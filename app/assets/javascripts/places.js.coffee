# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
window.pauseCarousel = new Boolean(false)

jQuery ->
  # Un-press pause-btn on modal exit
  $("#image-modal").on "hide", ->
    $('.btn.place-carousel-pause.active').removeClass 'active'
  
  # set pause to false on modal show
  $("#image-modal").on "show", ->  
    window.pauseCarousel = new Boolean(false)
    
  # Handle pause carousel  
  $('.place-carousel-pause').click ->
    console.log "Before Pause == " + window.pauseCarousel
    if window.pauseCarousel.valueOf() == false
      $('#place-carousel').carousel('pause')
      console.log "Pause"
      window.pauseCarousel = true
    else
      $('#place-carousel').carousel('next')
      $('#place-carousel').carousel('cycle')
      console.log "UnPause"
      window.pauseCarousel = false
    
    console.log "After Pause == " + window.pauseCarousel
      
  # Jump to image selected  
  $('.image-modal-link').click ->
    $('#place-carousel').carousel(parseInt($(this).data('image-frame')))
    
    
