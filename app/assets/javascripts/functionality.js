$(document).ready(function(){
	
	var Input = $('input[name="answer[name]"]');
	var default_value = Input.val();
	
	$('Input').click(function(event){
		if(Input.val() == default_value) Input.val("");
	});
	
	$('p.sign_in').click(function(event) {
		alert('You do not have permission to access this page');
		event.preventDefault();
	});
	
	$('Input').focusout(function() {
		if (Input.val() == "" ) {
			Input.val('Name Goes Here');
		};
	});
});