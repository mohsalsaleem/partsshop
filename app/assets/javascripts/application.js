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
//= require jquery.turbolinks
//= require turbolinks
//= require_tree .
//= require bootstrap-sprockets

$(document).ready(function(){
	if(navigator.userAgent.match(/Android/i)){
    window.scrollTo(0,1);
 }
 $.get('/cart/count',function(data, status){

	 console.log(data['count'])

 	// items = $('td#item_quantity');
 	// total_quantity = 0
 	// for(var i = 0;i < items.length; i++)
 	// {	
 	// 	total_quantity += parseInt(items[i].textContent)
 	// }
  $("#cart_counter").text('Cart ('+data['count']+')');	
 });
 
})