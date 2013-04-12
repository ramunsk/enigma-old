$ = jQuery

keyboard = new Keyboard $(".keyboard")

rotorDeck = new RotorDeck($(".rotors_container"),new Reflector(KnownReflectors.A), new Rotor(KnownRotors.I), new Rotor(KnownRotors.II), new Rotor(KnownRotors.III))

lampboard = new Lampboard $(".lampboard")

screen = new Screen $(".screen")

machine = new Machine(
	keyboard 
	rotorDeck 
	lampboard
	screen
)

path =
	input: "A"
	rightRotorForward: "S - A"
	middleRotorForward: "D - S"
	leftRotorForward: "M - D"
	reflectorFrom: "M"
	reflectorTo: "C"
	leftRotorBackward: "C - P"
	middleRotorBackward: "P - K"
	rightRotorBackward: "K - G"
	output: "G"
deck =
	rightRotor: "III"
	middleRotor: "II"
	leftRotor: "I"
	rightRotorPosition: "B"
	middleRotorPosition: "A"
	leftRotorPosition: "A"
	reflector: "A"

$('div.animate .button').click(() ->
	bl = new blockUI()
	bl.display path, deck
)