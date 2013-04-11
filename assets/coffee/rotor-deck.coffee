class RotorDeck
	constructor: (@reflector, @rotorLeft, @rotorMiddle, @rotorRight) ->
		@encrypt = (char) ->
			result = rotorRight.getForwardChar char
			result = rotorMiddle.getForwardChar result
			result = rotorLeft.getForwardChar result
			result = reflector.getOutput result
			result = rotorLeft.getBackwardChar result
			result = rotorMiddle.getBackwardChar result
			result = rotorRight.getBackwardChar result
			return result
		@advanceRotors = () ->
			rotorRight.advanceForward
			return

@RotorDeck = RotorDeck

