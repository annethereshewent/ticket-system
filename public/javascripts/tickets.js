$(document).ready(function() {
	$("#status_closed").click(function() {
		$("#ticket-loading").show();
		$.get('/tickets/closed', function(data) {
			$("#ticket-loading").hide();
			$("#main-table").hide();
			$("#main-table").html(data);
			$("#main-table").fadeIn(500).show();
		});
	});

	$("#status_open").click(function() {		
		$("#ticket-loading").show();
		$.get('/tickets/open', function(result) {
			$("#ticket-loading").hide();
			$("#main-table").hide();
			$("#main-table").html(result);
			$("#main-table").fadeIn(500).show();
		});
	});
});
