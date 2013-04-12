class animate
	paper = null
	config = 
		fontSize: 60
		fontFamily: "Arial, Helvetica, sans-serif"
		canvasWidth: 1200
		canvasHeight: 900
		inputLetterX: 1100
		inputLetterY: 320
		rectangleRightX: 775
		rectangleRightY: 150
		rectangleWidth: 150
		rectangleHeight: 300
		rectangleBorder: 20
		rotorTextInitialX: 850
		rotorStep: 250
		rotorNameY: 200
		rotorTransformationY: 320
		reflectorRectangleX: 20
		reflectorRectangleY: 250
		reflectorWidth: 150
		reflectorHeight: 500
		reflectorTextInitialX: 90
		reflectorNameY: 300
		reflectorTransformationX: 90
		reflectorTransformationY: 470
		arrowForwardInputX: 1050
		arrowForwardRotorX: 765
		arrowForwardY: 300
		arrowBackwardX: 1050
		arrowBackwardY: 680
		arrowStep: 250
		arrowLenght: 90
	constructor : (element) ->
		paper = Raphael document.getElementById(element), config.canvasWidth, config.canvasHeight
		@updateConfig = () ->
			config.rectangleRightY = 530
			config.rotorNameY = 580
			config.rotorTransformationY = 700
			config.inputLetterY = 700
		@resetConfig = () ->
			config.rectangleRightY = 150
			config.rotorNameY = 200
			config.rotorTransformationY = 320
			config.inputLetterY = 320
		@writeChar = (x, y, char) ->
			char = paper.text x, y, char
			char.attr { "font-size": config.fontSize, "font-family": config.fontFamily }
			@animateElement char
		@drawRect = (x, y, width, height, r) ->
			rect = paper.rect x, y, width, height, r
			rect.attr("fill", "#DDD")
			@animateElement rect
		@drawInputChar = (char) ->
			p = @writeChar config.inputLetterX, config.inputLetterY, char
			@animateElement p

		@drawRotor = (rotor, rotorPosition, offset, backward) ->
			@drawRect config.rectangleRightX - offset, config.rectangleRightY, config.rectangleWidth, config.rectangleHeight, config.rectangleBorder
			@writeChar config.rotorTextInitialX - offset, config.rotorNameY, rotor
			@writeChar config.rotorTextInitialX - offset, config.rotorNameY - 100 , rotorPosition

		
		@drawRotorTransformation = (text, offset) ->
			@writeChar config.rotorTextInitialX - offset, config.rotorTransformationY, text
		
		@drawReflector = (reflector) ->
		 	@drawRect config.reflectorRectangleX, config.reflectorRectangleY, config.reflectorWidth, config.reflectorHeight, config.rectangleBorder
		 	@writeChar config.reflectorTextInitialX, config.reflectorNameY, reflector

		#rotors
		@drawRightRotor = (rotor, rotorPosition, backward) ->
			@drawRotor rotor, rotorPosition, config.rotorStep * 0, backward
		@drawMiddleRotor = (rotor, rotorPosition, backward) ->
			@drawRotor rotor, rotorPosition, config.rotorStep * 1, backward
		@drawLeftRotor = (rotor, rotorPosition, backward) ->
			@drawRotor rotor, rotorPosition, config.rotorStep * 2, backward

		#rotor positions


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

		@animateElement = (element) ->
			# anim = Raphael.animation {opacity: 1}, 100
			# wait = Raphael.animation({opacity: 0}, 5, () -> this.animate anim.repeat 10)
			# element.animate wait
		#paths
		@drawPaths = () ->
			
		@drawArrow = (x, y, w) ->
			p = paper.path "M#{x} #{y}L#{x - w} #{y}"
			@animateElement p
			p = paper.path "M#{x - w} #{y}L#{x - w + 15} #{y - 15}"	
			@animateElement p
			p = paper.path "M#{x - w - 25} #{y + 6}L#{x - w + 15} #{y - 15}"
			@animateElement p
			p = paper.path "M#{x - w - 25} #{y + 6}L#{x - w + 15} #{y + 25}"
			@animateElement p
			p = paper.path "M#{x - w} #{y + 10}L#{x - w + 15} #{y + 25}"
			@animateElement p
			p = paper.path "M#{x} #{y + 10}L#{x - w} #{y + 10}"
			@animateElement p
			p = paper.path "M#{x} #{y}L#{x} #{y + 10}"
			@animateElement p

		@drawBackwardArrow = (x, y, w) ->
			p = paper.path "M#{x - w} #{y}L#{x} #{y}"
			@animateElement p
			p = paper.path "M#{x} #{y}L#{x - 15} #{y - 15}"	
			@animateElement p
			p = paper.path "M#{x - 15} #{y - 15}L#{x + 25} #{y + 6}"
			@animateElement p
			p = paper.path "M#{x + 25} #{y + 6}L#{x - 15} #{y + 25}"
			@animateElement p
			p = paper.path "M#{x - 15} #{y + 25}L#{x} #{y + 10}"
			@animateElement p
			p = paper.path "M#{x} #{y + 10}L#{x - w} #{y + 10}"
			@animateElement p
			p = paper.path "M#{x - w} #{y}L#{x - w} #{y + 10}"
			@animateElement p

		#play all
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
				rightRotorPosition: "B"
				middleRotorPosition: "A"
				leftRotorPosition: "A"
				reflector: "A"
			
			@drawInputChar path.input
			
			@drawArrow config.arrowForwardInputX, config.arrowForwardY, config.arrowLenght

			@drawRightRotor deck.rightRotor, deck.rightRotorPosition
			@drawRightRotorTransformation path.rightRotorForward

			@drawArrow config.arrowForwardRotorX, config.arrowForwardY, config.arrowLenght - 40

			@drawMiddleRotor deck.middleRotor, deck.middleRotorPosition
			@drawMiddleRotorTransformation path.middleRotorForward

			@drawArrow config.arrowForwardRotorX - config.arrowStep, config.arrowForwardY, config.arrowLenght - 40

			@drawLeftRotor deck.leftRotor, deck.leftRotorPosition
			@drawLeftRotorTransformation path.leftRotorForward

			@drawArrow config.arrowForwardRotorX - config.arrowStep * 2, config.arrowForwardY, config.arrowLenght - 40

			@drawReflector deck.reflector
			@drawReflectorTransformation path.reflectorFrom, path.reflectorTo

			@drawBackwardArrow config.arrowForwardRotorX - config.arrowStep * 2 - 20, config.arrowBackwardY, config.arrowLenght - 40

			@updateConfig()

			@drawLeftRotor deck.leftRotor, "", false
			@drawLeftRotorTransformation path.leftRotorBackward

			@drawBackwardArrow config.arrowForwardRotorX - config.arrowStep - 20, config.arrowBackwardY, config.arrowLenght - 40

			@drawMiddleRotor deck.middleRotor, "", false
			@drawMiddleRotorTransformation path.middleRotorBackward

			@drawBackwardArrow config.arrowForwardRotorX - 20, config.arrowBackwardY, config.arrowLenght - 40

			@drawRightRotor deck.rightRotor, "", false
			@drawRightRotorTransformation path.rightRotorBackward

			@drawBackwardArrow config.arrowForwardInputX - 20, config.arrowBackwardY, config.arrowLenght

			@drawInputChar path.output

			@resetConfig()

@animate = animate