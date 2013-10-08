// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function(){  

	$(".alert").alert();

	$('.donatebar').click(function (){
		console.log("Yo");
	});

	var shifting = false;

	console.log("Yo");

	$('input[type="text"].pledge-input').on('keypress', function (event) {
	    if(event.which == 13){
	        $('.go-button').click();
	    }
	});

	$('.go-button').click(function() { 
		console.log("Yo");
		$value = $(this).parent().find('input').val();
		$('.item-pledge').html('Pledge your '+$value);

		shifting = true;

		$('.iwantodonate').animate({
				height: "825px"
			},
			3000,
			'easeOutExpo',
			function() {
				console.log('Chaos');
				shifting = false;
			});

		$('html,body').animate({
        scrollTop: $('.iwantodonate').offset().top},
        'slow');

	});

});

