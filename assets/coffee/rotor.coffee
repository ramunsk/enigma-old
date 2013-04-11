class Rotor
	constructor: (knownRotor) ->
		currentPosition = knownRotor.rightSide.charAt(0)
		events = {}

		getOffset = () ->
			knownRotor.rightSide.indexOf currentPosition

		@getForwardChar = (char) ->
			index = knownRotor.rightSide.indexOf(char.toUpperCase())
			offset = getOffset()
			position = index + offset
			position = position - knownRotor.rightSide.length if position >= knownRotor.rightSide.length
			knownRotor.leftSide.charAt(position)

		@getBackwardChar = (char) ->
			index = knownRotor.leftSide.indexOf(char.toUpperCase())
			offset = getOffset()
			position = index + offset
			position = position - knownRotor.rightSide.length if position >= knownRotor.rightSide.length
			knownRotor.rightSide.charAt(position)
		
		@getPosition = (char) ->
			currentPosition

		@setPosition = (char) ->
			if knownRotor.rightSide.indexOf(char) >= 0
				currentPosition = char

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
