class animate
	paper = null
	config = 
		fontSize: 60
		fontFamily: "Arial, Helvetica, sans-serif"
		canvasWidth: 1200
		canvasHeight: 1100
		inputLetterX: 1100
		inputLetterY: 200
		rectangleRightX: 775
		rectangleRightY: 50
		rectangleWidth: 150
		rectangleHeight: 300
		rectangleBorder: 20
		rotorTextInitialX: 850
		rotorStep: 250
		rotorNameX: 80
		rotorTransformationX: 200
		reflectorRectangleX: 20
		reflectorRectangleY: 150
		reflectorWidth: 150
		reflectorHeight: 500
		reflectorTextInitialX: 90
		reflectorNameX: 180
		reflectorTransformationX: 90
		reflectorTransformationY: 350
	constructor : (element) ->
		paper = Raphael document.getElementById(element), config.canvasWidth, config.canvasHeight
		@updateConfig = () ->
			config.rectangleRightY = 450
			config.rotorNameX = 480
			config.rotorTransformationX = 600
			config.inputLetterY = 600
		@writeChar = (x, y, char) ->
			char = paper.text x, y, char
			char.attr { "font-size": config.fontSize, "font-family": config.fontFamily }
		@drawRect = (x, y, width, height, r) ->
			rect = paper.rect x, y, width, height, r
		@drawInputChar = (char) ->
			@writeChar config.inputLetterX, config.inputLetterY, char
		@drawRotor = (rotor, offset) ->
			@drawRect config.rectangleRightX - offset, config.rectangleRightY, config.rectangleWidth, config.rectangleHeight, config.rectangleBorder
			@writeChar config.rotorTextInitialX - offset, config.rotorNameX, rotor
		@drawRotorTransformation = (text, offset) ->
			@writeChar config.rotorTextInitialX - offset, config.rotorTransformationX, text
		@drawReflector = (reflector) ->
		 	@drawRect config.reflectorRectangleX, config.reflectorRectangleY, config.reflectorWidth, config.reflectorHeight, config.rectangleBorder
		 	@writeChar config.reflectorTextInitialX, config.reflectorNameX, reflector

		#rotors
		@drawRightRotor = (rotor) ->
			@drawRotor rotor, config.rotorStep * 0
		@drawMiddleRotor = (rotor) ->
			@drawRotor rotor, config.rotorStep * 1
		@drawLeftRotor = (rotor) ->
			@drawRotor rotor, config.rotorStep * 2

		#transformations
		@drawRightRotorTransformation = (text, offset) ->
			@drawRotorTransformation text, config.rotorStep * 0
		@drawMiddleRotorTransformation = (text, offset) ->
			@drawRotorTransformation text, config.rotorStep * 1
		@drawLeftRotorTransformation = (text, offset) ->
			@drawRotorTransformation text, config.rotorStep * 2
		@drawReflectorTransformation = (from, to) ->
			@writeChar config.reflectorTransformationX, config.reflectorTransformationY, from
			@writeChar config.reflectorTransformationX, config.reflectorTransformationY + 50, "-"
			@writeChar config.reflectorTransformationX, config.reflectorTransformationY + 100, to

		@play = (path, deck) ->
			path =
				input: "A"
				rightRotorForward: "S - A"
				middleRotorForward: "D - S"
				leftRotorForward: "M - D"
				reflectorFrom: "M"
				reflectorTo: "C"
				leftRotorBackward: "C - P"
				middleRotorBackward: "P - K"
				rightRotorBackward: "K - L"
				output: "G"
			deck =
				rightRotor: "III"
				middleRotor: "II"
				leftRotor: "I"
				reflector: "A"
			
			@drawInputChar(path.input);
			
			@drawRightRotor(deck.rightRotor)
			@drawRightRotorTransformation(path.rightRotorForward)

			@drawMiddleRotor(deck.middleRotor)
			@drawMiddleRotorTransformation(path.middleRotorForward)

			@drawLeftRotor(deck.leftRotor)
			@drawLeftRotorTransformation(path.leftRotorForward)

			@drawReflector(deck.reflector)
			@drawReflectorTransformation(path.reflectorFrom, path.reflectorTo)

			@updateConfig()
			@drawLeftRotor(deck.leftRotor)
			@drawLeftRotorTransformation(path.leftRotorBackward)

			@drawMiddleRotor(deck.middleRotor)
			@drawMiddleRotorTransformation(path.middleRotorBackward)

			@drawRightRotor(deck.rightRotor)
			@drawRightRotorTransformation(path.rightRotorBackward)

			@drawInputChar(path.output);

@animate = animate