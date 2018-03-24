$(document).ready(function() {
	$.ajax({
		type : "GET",
		url : "http://localhost:8080/api/events",
		contentType : "application/json",
		dataType : "json",
		data : "",
	}).done(function(result) {
		$('#calendar').fullCalendar({
			header : {
				left : 'prev,next today',
				center : 'title',
				right : ''
			},
			aspectRatio : 0.9,
			locale : 'ja',
			buttonIcons : true,
			navLinks : false,
			eventLimit : true,
			events : result
		});
	});

	// $('#top').
});
