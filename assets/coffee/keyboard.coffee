jQuery ($) ->
	$('body').keydown (e) ->
		Keyboard.playKeystrokeSound();
		Keyboard.keyDown(e);

	$('body').keyup (e) ->
		Keyboard.keyUp(e);

	$('.key').click ->
		Keyboard.playKeystrokeSound();
		Keyboard.buttonPressed(this);
	
	class Keyboard

		currentLetter = null;

		#input type=button clicked
		@buttonPressed: (button) ->

			if (currentLetter == null)
				letter = $(button).val();

				currentLetter = letter;
				

				#TODO: Send to rotor 
				#console.log(letter);

				currentLetter = null;
			Keyboard.stopKeystrokeSound();

		#keyDown was called
		@keyDown: (e) ->
			if (currentLetter is null and e.keyCode >= 65 and e.keyCode <= 90)
				console.log('down');

				currentLetter = String.fromCharCode(e.keyCode);;
				button = $('.key[value='+currentLetter+']');

				#TODO: #light on letter
				$(button).css('background-color', '#d7df01');

		#keyUp was called
		@keyUp: (e) ->
			if (e.keyCode >= 65 and e.keyCode <= 90)
				letter = String.fromCharCode(e.keyCode);
				if (letter is currentLetter)
					button = $('.key[value='+letter+']');
					
					currentLetter = null;
					Keyboard.buttonPressed(button);

					#TODO: #light off letter
					$(button).css('background-color', '#424242');


		@stopKeystrokeSound:() ->
			document.getElementById('keystroke_sound').pause();			
			document.getElementById('keystroke_sound').currentTime = 0
			

		@playKeystrokeSound:() ->
			document.getElementById('keystroke_sound').play();

					

	

