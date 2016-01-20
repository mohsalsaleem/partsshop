# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "page:change", ->
	console.log("Saleem")
	$('a[data-id="update"]').click ->
  	#	console.log($(this).attr('id'))
  		product_id_attr_value = $(this).attr('id')
  		product_id = product_id_attr_value.slice(11)
  	#	alert(product_id)
  	#	console.log($('input#product_id_'+product_id).val())
  		quantity = $('input#product_id_'+product_id).val()
  		console.log("Saleem")
  		$.ajax '/cart/decrement_count?product_id='+product_id+'&quantity='+quantity,
  			type: 'GET',
  			success: ->
  				location.reload();
