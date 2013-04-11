class Rotor
	constructor: (knownRotor) ->
		currentPosition = knownRotor.rightSide.charAt(0)
		events = {}

		@getForwardChar = (char) ->
			index = knownRotor.rightSide.indexOf(char.toUpper())
			knownRotor.leftSide.charAt(index)

		@getBackwardChar = (char) ->
			index = knownRotor.leftSide.indexOf(char.toUpper())
			knownRotor.rightSide.charAt(index)
		
		@getPosition = (char) ->
			currentPosition

		#@setPosition = (char) ->
		#	if knownRotor.rightSide.indexOf(char) >= 0
		#		currentPosition = char

		@advanceForward = () ->
			index = knownRotor.right.indexOf(currentPosition)
			if index == knownRotor.right.length - 1
				index = 0
			else
				index++
			currentPosition = knownRotor.rightSide.charAt index
			if events.hasOwnProperty('positionChanged')
				events.positionChanged.foreach (fn) ->
					fn.call(undefined)
					return
			return
			
		@advanceBackward = () ->
			index = knownRotor.right.indexOf(currentPosition)
			if index == 0 
				index = knownRotor.right.length - 1
			else
				index--
			currentPosition = knownRotor.rightSide.charAt(index)

		@on = (event, callback) ->
			if typeof callback isnt 'function'
				return
			if !events.hasOwnProperty(event)
				events[event] = []
			events[event].push(callback)
			return

@.Rotor = Rotor	
