$ = jQuery

keyboard = new Keyboard $(".keyboard")

rotorDeck = new RotorDeck(new Reflector(KnownReflectors.A), new Rotor(KnownRotors.I), new Rotor(KnownRotors.II), new Rotor(KnownRotors.III))

lampboard = new Lampboard $(".lampboard")

screen = new Screen $(".screen")

machine = new Machine(
	keyboard 
	rotorDeck 
	lampboard
	screen
)