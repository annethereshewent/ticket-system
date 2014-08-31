function openRegister() {
	$("#loginPanel").fadeOut(500).hide();
	$("#registerPanel").fadeIn(500).show();
}
function validate() {
	$(".error").each(function() {
		$(this).hide();
	});
	checkOk = true;
	if ($("#reg-username").val() == "") {
		$("#username-error").html("*: Required");
		$("#username-error").show();
		checkOk = false;
	}
	if ($("#reg-password").val() == "") {
		$("#password-error").html("*: Required");
		$("#password-error").show();
		checkOk = false;
	}
	if (checkOk) {
		var re = /^(.*[0-9].*[A-Z].*)|(.*[A-Z].*[0-9].*)$/;
		if ($("#reg-password").val().length < 8 && !re.test($("#reg-password").val()))  {
			$("#password2-error").html("Password must be at least 8 characters and contain one capital letter and number");
			$("#password2-error").show();
			return false;
		}
		else if ($("#reg-password").val() != $("#reg-password2").val()) {
			$("#password2-error").html("Passwords do not match");
			$("#password2-error").show();
			return false;
		}
		else {
			//need to check that username is unique
			$("#reg-loading").show();
			$.ajax({ 
				url: "/users/validate/" + $("#reg-username").val(),
				type: "GET",
				success: function(data) {
					$("#reg-loading").hide();
					if (data == "true") {
						$("#register-form").submit();
						//alert("ok this is weird");
					}
					else {
						$("#username-error").html("Username is already taken");
						$("#username-error").show();
						return false;
					}
				}

			});
		}
	}

}
function closeRegister() {
	$("#registerPanel").fadeOut(500).hide();
	$("#loginPanel").fadeIn(500).show();
}