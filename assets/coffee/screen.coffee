$ = jQuery
class Screen
	constructor: (uiElement) ->
		input = ""
		output = ""

		@addToInput = (char) ->
			input += char;
			$(uiElement).find(".input").html(input);
			return

		@addToOutput = (char) ->
			output += char
			$(uiElement).find(".output").html(output);
			return
@.Screen = Screen