$ = jQuery
class Keyboard
	constructor: (uiElement) ->
		currentLetter = null;
		keyElements = {}
		events = {}

		$(uiElement).find(".key").each(
			->
				el = $(@)
				keyElements[el.data("key")] = el
				return
		)

		$(document).on(
			'keydown'
			(e) ->
				if e.keyCode >= 65 and e.keyCode <= 90
					document.getElementById('keystroke_sound').play();
					onKeyDown  String.fromCharCode e.keyCode
					return
		)

		$(document).on(
			'keyup'
			(e) ->
				if e.keyCode >= 65 and e.keyCode <= 90
					document.getElementById('keystroke_sound').pause();			
					document.getElementById('keystroke_sound').currentTime = 0
					onKeyUp  String.fromCharCode e.keyCode
					return
		)
		
		$(uiElement).on(
			'mousedown'
			'.key'
			->
				document.getElementById('keystroke_sound').play();
				onKeyDown $(@).data("key")
				return
		)
		
		$(uiElement).on(
			'mouseup'
			'.key'
			->
				document.getElementById('keystroke_sound').pause();			
				document.getElementById('keystroke_sound').currentTime = 0
				onKeyUp($(@).data("key"))
				return
		)

		raiseEvent = (event, eventData) ->
			if events.hasOwnProperty(event)
				#log "Raising event '#{event}'"
				events[event].forEach (fn) ->
					if eventData
						fn.call(undefined, eventData)
					else
						fn.call(undefined)
					return
			return

		@on = (event, callback) ->
			if typeof callback isnt 'function'
				return
			if !events.hasOwnProperty(event)
				events[event] = []
			events[event].push(callback)
			return

		onKeyDown = (char) ->
			if currentLetter
				return
			currentLetter = char
			keyElements[char].addClass "pressed"
			raiseEvent 'keydown', {key: char}
			return

		onKeyUp = (char) ->
			if not currentLetter or currentLetter != char
				return
			currentLetter = null
			keyElements[char].removeClass "pressed"
			raiseEvent 'keyup', {key: char}
			return



@.Keyboard = Keyboard
		