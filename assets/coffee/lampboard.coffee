class Lampboard
	constructor: (uiElement) ->
		currentChar = null
		lamps = {}

		$(uiElement).find(".lamp").each ->
			el = $(@)
			lamps[el.data("key")] = el
			return

		@turnOff = ->
			if currentChar?
				lamp = lamps[currentChar];
				if lamp?
					$(lamp).removeClass('active');
				currentChar = null
			return

		@turnOn = (char) ->
			@turnOff()
			lamp = lamps[char];
			if lamp?
				$(lamp).addClass('active');
			currentChar = char
			return

@.Lampboard = Lampboard