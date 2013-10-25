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

String.prototype.contains = function(it) { return this.indexOf(it) != -1; };

var do_on_load = function() {  

	$(".alert").alert();

	$('input[type="checkbox"]').removeClass('form-control');

	$('#donation_ph_no').parent().addClass('input-group');
	$('.input-group').prepend('<span class="input-group-addon">+91</span>');

	var hash = window.location.hash.substring(1);
	console.log(hash);

	if(hash=='open-form') $('.iwantodonate').addClass('donation-started');

	var shifting = false;


	$('input[type="text"].pledge-input').on('keypress', function (event) {
	    if(event.which == 13){
	        $('.go-button').click();
	    }
	});

	$('.pledge-input').keyup(function(event) {
		var first = $(this).val().charAt(0);
		if (first == ' ') $('.vowels').html('I want to donate an');
		var vowels = 'aAeEiIoOuU';
		if($.inArray(first, vowels)) {
			$('.vowels').html('I want to donate a');
		} else {
			$('.vowels').html('I want to donate an');
		}
	});

	$('.go-button').click(function() { 
		if(!shifting){
			$value = $(this).parent().find('input').val();
			$('.item-pledge').html('Pledge your <span class="pledged">'+$value+'</span>');
			$('.donation_name input').first().val($value);
			shifting = true;
	
			$('.iwantodonate').animate({
					height: "506px",
					padding: "20px 0"
				},
				2000,
				'easeOutExpo',
				function() {
					$(this).addClass('donation-started');
					shifting = false;
				});
	
			$('html,body').animate({
	        scrollTop: $('.iwantodonate').offset().top},
	        'slow');
		}

	});

	$('.close-pledge').click(function() { 
		if(!shifting){
			shifting = true;
		
			$('.iwantodonate').removeClass('donation-started');
			$('.iwantodonate').animate({
					height: "0",
					padding: "0"
				},
				2000,
				'easeOutExpo',
				function() {
					shifting = false;
				});
	
			$('html,body').animate({
	        scrollTop: $('.iwantodonate').offset().top},
	        'slow');
		}

	});
	$('#city').change(function () {
	           $.get($("#gs").attr("action"), $("#gs").serialize(), null, "script");
	          return false;
	});

          $('#search').keyup(function () {
                   $.get($("#gs").attr("action"), $("#gs").serialize(), null, "script");
                  return false;
});


};

        
    


$(document).ready(do_on_load);
$(window).bind('page:change', do_on_load);

