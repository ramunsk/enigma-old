class Rotor
	constructor: (knownRotor, debug) ->
		currentPosition = knownRotor.rightSide.charAt(0)
		events = {}

		getOffset = () ->
			knownRotor.rightSide.indexOf currentPosition

		raiseEvent = (event) ->
			if events.hasOwnProperty(event)
				log "Raising event '#{event}'"
				events[event].forEach (fn) ->
					fn.call(undefined)
					return
			return

		log = (text) ->
			console.log text if debug and console.log
			return

		warn = (text) ->
			console.warn text if debug and console.warn
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
			index = knownRotor.rightSide.indexOf(currentPosition)
			index++
			index = 0 if index >= knownRotor.rightSide.length
			prevPosition = currentPosition
			currentPosition = knownRotor.rightSide.charAt index
			log "Rotor #{knownRotor.type} advanced to #{currentPosition}"
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
