$(document).ready(function() {
	moment.locale("ja");
	setInterval(function() {
		var currentTime = moment().format("YYYY年MM月DD日（ddd） HH:mm:ss ");
		$('#currentTime').html(currentTime);
	}, 1000);

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
			events : result,
			dayClick : function(date, event) {
				event.preventDefault();
				$("#start").val(date.format());
				$('#modal-detail').iziModal('open', event);
			},
		});
	});

	$('#reload').click(function() {
		location.reload();
	});

	$('#bus').click(function(event) {
		event.preventDefault();
		$('#modal-default').iziModal('open');
	});
	$('#modal-default').iziModal({
		headerColor : '#26A69A',
		width : 700,
	});

	$('#event1').click(function(event) {
		event.preventDefault();
		$('#modal-event1').iziModal('open');
	});
	$('#modal-event1').iziModal({
		headerColor : '#26A69A',
		width : 800,
	});

	$('#event2').click(function(event) {
		event.preventDefault();
		$('#modal-event2').iziModal('open');
	});
	$('#modal-event2').iziModal({
		headerColor : '#26A69A',
		width : 800,
	});

	$('#modal-detail').iziModal({
		headerColor : '#26A69A',
		width : 600,
		overlayClose : false,
	});
	$("#modal-detail").on('click', '#regist', function(event) {
		if ($("#start").val() == "") {
			return;
		} else {
			var startDate = moment($("#start").val()).format("YYYY-MM-DD");
			$.ajax({
				type : "GET",
				url : "http://localhost:8080/api/events/add",
				contentType : "application/json",
				dataType : "json",
				data : {
					start : startDate,
					title : $("#title").val(),
					detail : $("#detail").val(),
				},
			}).always(function() {
				$('#modal-detail').iziModal('close');
			});
		}
	});

});
