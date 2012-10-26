# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery.fn.editInterest = ->
	@find('input[type=submit]').remove()
	@find('select').change ->
		console.log $(this).val()
		$(this).parent('form').submit()
	this
	
jQuery.fn.addOnClickActivities = ->
	console.log "Add OnClick"
	$('.current-activity-name').click ->
		$(".current-activity-user-rating[data-activity-id='"+$(this).data('activity-id')+"']").toggle()
		$(".current-user-rating-options[data-activity-id='"+$(this).data('activity-id')+"']").toggle()
		$(".delete-current-activity[data-activity-id='"+$(this).data('activity-id')+"']").toggle()
	$('.optional-activity-name').click ->
		console.log $(this).html() + " activity clicked "

jQuery.fn.addOnClickZipCode = ->
	$('#zip-code').click ->
		$(this).toggle()
		$('.update-zip-code-form').toggle()
	$('#update-zip-code-x').click ->
		$('.update-zip-code-form').toggle()
		$('#zip-code').toggle()
	

jQuery ->
	$('.edit_interest').editInterest()
	$('.new_interest').editInterest()
	$('.on-click').addOnClickActivities()
	$('.zip-code').addOnClickZipCode()
	
	# Add Activity Btn Click Listing
	$('#add-activity-btn').click ->
		$('#add-activity').toggle()
		if $(this).html() == '+'
			$(this).html('-')
		else
			$(this).html('+')
	
	
			
	
		