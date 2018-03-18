$(document).ready(function() {
	$('#calendar').fullCalendar({
		header : {
			left : 'prev,next today',
			center : 'title',
			right : ''
		},
		aspectRatio : 0.9,
		locale : 'ja',
		buttonIcons : true, // show the prev/next text
		navLinks : false, // can click day/week names to navigate views
		eventLimit : true, // allow "more" link when too many events
		events : [ {
			title : 'All Day Event',
			start : '2018-02-01'
		}, {
			title : 'Click for Google',
			url : 'http://google.com/',
			start : '2018-02-28'
		} ]
	});
	// $('#top').
});
