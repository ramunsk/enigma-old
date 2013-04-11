$ = jQuery

keyboard = new Keyboard()

rotorDeck = new RotorDeck (
	new Reflector KnowReflectors.A
	new Rotor KnownRotors.I
	new Rotor KnownRotors.II
	new Rotor KnownRotors.III
)


lampboard = new Lampboard()

machine = new Machine(
	keyboard 
	rotorDeck 
	lampboard
)