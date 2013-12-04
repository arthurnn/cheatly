'use strict';

$(document).ready(function(){
	$('.anchor').on('click', function(e){
		var link = $(this).attr('href');
		$('html, body').animate({
			scrollTop: $(link).offset().top-70
		}, 1000);
		e.preventDefault();
	});
});