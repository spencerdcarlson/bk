# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery.fn.addClickToFigCap = ->
  $(this).bind
    click: ->
      $(this).find('.form-toggle').removeClass('hide')
      $(this).removeClass('hover-gray')
      $(this).find('#image_title').focus()
      $(this).unbind 'click'
  
jQuery ->
  $('.toggle-update-form').bind
    click: ->
      $(this).find('.form-toggle').removeClass('hide')
      $(this).removeClass('hover-gray')
      $(this).find('#image_title').focus()
      $(this).unbind 'click'
  $('.close-figcap').live 'click', ->
      $('.form-toggle').addClass('hide')
      $('.toggle-update-form').addClass('hover-gray')
      $('.toggle-update-form').addClickToFigCap()