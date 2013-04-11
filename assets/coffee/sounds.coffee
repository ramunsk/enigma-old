jQuery ($) ->	

	class Sounds
		@playKeystrokeSound:() ->
			document.getElementById('keystroke_sound').play();
			