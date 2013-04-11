class RotorDeck
	constructor: (@reflector, @rotor3, @rotor2, @rotor1) ->
		@encrypt = (char) ->
			result = rotor3.getForwardChar char
			result = rotor2.getForwardChar result
			result = rotor1.getForwardChar result
			result = reflector.getOutput result
			result = rotor1.getBackwardChar result
			result = rotor2.getBackwardChar result
			result = rotor3.getBackwardChar result
			return result
		@advanceRotors = () ->
			#
			return this

@RotorDeck = RotorDeck

