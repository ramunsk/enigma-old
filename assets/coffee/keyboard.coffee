jQuery ($) ->
	$('.key').click ->
		Keyboard.keyPressed(this);


	class Keyboard
		@keyPressed: (button) ->
			value = $(button).val();
			alert (value);	


	

