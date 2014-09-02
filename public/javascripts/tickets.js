$(document).ready(function() {
	$("#status_closed").click(function() {
		$("#ticket-loading").show();
		$.get('/tickets/closed_ajax', function(data) {
			$("#ticket-loading").hide();
			$("#main-table").hide();
			$("#main-table").html(data);
			$("#main-table").fadeIn(500).show();
		})
	});

	$("#status2_open").click(function() {
		
		$("#ticket-loading").show();
		$.get('tickets/open_ajax', function(data) {
			$("#ticket-loading").hide();
			$("#main-table").hide();
			$("#main-table").html(data);
			$("#main-table").fadeIn(500).show();
		})
	});
});