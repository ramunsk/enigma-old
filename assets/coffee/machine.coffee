class Machine
	constructor: (keyboard, rotorDeck, lampboard) ->
		rotorDeck.on(
			'characterEncrypted'
			(e) -> lampboard.turnOn e.result
		)
@.Machine = Machine		