// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require materialize-sprockets
//= require cart
//= require jquery.turbolinks
//= require turbolinks
//= require_tree .
//= require bootstrap-sprockets

if(document.readyState == "loading")
{
	console.log("loading...")
	$('div.root').hide();
	$('#root').show();


}

var ready = function() {
    // do stuff here.
	$('div#root').hide();
	$('div.root').show();

    $(".button-collapse").sideNav()

	if(navigator.userAgent.match(/Android/i)){
    window.scrollTo(0,1);
 	}

	 $.get('/cart/count',function(data, status){
	  $("#cart_counter").text(data['count']);
	 });

   $('#add_to_cart').click(function() {
		// var value = $("#cart_counter").text();
		// var int_value = parseInt(value)
		// int_value += 1
		// $("#cart_counter").text(int_value);
		$.get('/cart/count',function(data, status){
	  		$("#cart_counter").text(data['count']);
	 });
	});
 
};

$(document).ready(ready);
$(document).on('page:change', ready);
