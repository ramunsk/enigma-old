class RotorDeck
	constructor: (@reflector, @rotorLeft, @rotorMiddle, @rotorRight) ->
		events = {}

		@rotorRight.on(
			"turnover"
			-> rotorMiddle.advanceForward()
		)
		@rotorMiddle.on(
			"turnover"
			-> rotorLeft.advanceForward()
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


		@encrypt = (char) ->
			result = rotorRight.getForwardChar char
			result = rotorMiddle.getForwardChar result
			result = rotorLeft.getForwardChar result
			result = reflector.getOutput result
			result = rotorLeft.getBackwardChar result
			result = rotorMiddle.getBackwardChar result
			result = rotorRight.getBackwardChar result
			raiseEvent 'characterEncrypted', {result: result}
			return result


		@advanceRotors = () ->
			rotorRight.advanceForward()
			return

@RotorDeck = RotorDeck

