class Rotor
	constructor: (knownRotor) ->
		currentPosition = knownRotor.rightSide.charAt(0)
		events = {}

		getOffset = () ->
			knownRotor.rightSide.indexOf currentPosition

		raiseEvent = (event) ->
			if events.hasOwnProperty(event)
				events[event].foreach (fn) ->
					fn.call(undefined)
					return
			return

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
			index++
			index = 0 if index >= knownRotor.right.length
			prevPosition = currentPosition
			currentPosition = knownRotor.rightSide.charAt index
			raiseEvent "advancedForward"
			raiseEvent "turnover" if prevPosition == knownRotor.turnover

			return
			
		@advanceBackward = () ->
			index = knownRotor.right.indexOf(currentPosition)
			index--
			index = knownRotor.right.length - 1 if index < 0
			return

		@on = (event, callback) ->
			if typeof callback isnt 'function'
				return
			if !events.hasOwnProperty(event)
				events[event] = []
			events[event].push(callback)
			return

@.Rotor = Rotor	
