class Machine
	constructor: (keyboard, rotorDeck, lampboard, screen) ->
		keyboard.on(
			'keydown'
			(e) ->
				rotorDeck.encrypt e.key
				screen.addToInput e.key
		)

		keyboard.on(
			'keyup'
			(e) ->
				lampboard.turnOff()
				rotorDeck.advanceRotors()
		)

		rotorDeck.on(
			'characterEncrypted'
			(e) -> 
				lampboard.turnOn e.result
				screen.addToOutput e.result
		)
@.Machine = Machine		