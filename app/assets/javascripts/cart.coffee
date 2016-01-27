# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "page:change", ->
	$('a[data-id="update"]').click ->
  	#	console.log($(this).attr('id'))
  		product_id_attr_value = $(this).attr('id')
  		product_id = product_id_attr_value.slice(11)
  	#	alert(product_id)
  	#	console.log($('input#product_id_'+product_id).val())
  		quantity = $('input#product_id_'+product_id).val()
  	#	console.log("Saleem")
  		$.ajax '/cart/decrement_count?product_id='+product_id+'&quantity='+quantity,
  			type: 'GET',
  			success: (data) ->
          if data['notice'] is 1
            toastContent = $('<span>Updating...!</span>');
            Materialize.toast(toastContent, 3000);
            location.reload();
            location.reload();# Do it Twice..
          else if data['notice'] is 0
            toastContent = $('<span>Removing...!</span>');
            Materialize.toast(toastContent, 3000);
            location.reload();
            location.reload();# Do it Twice..
            location.reload();


