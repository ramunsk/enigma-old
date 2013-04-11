describe "reflector deck. setup - reflector A, rotor right - III, rotor middle - II, rotor left - I, initial position: AAA", ->
	reflector = null
	rotorRight = null
	rotorMiddle = null
	rotorLeft = null
	rotorDeck = null

	beforeEach ->
		reflector = new Reflector KnownReflectors.A
		
		rotorRight = new Rotor KnownRotors.III
		rotorRight.setPosition "A"
		
		rotorMiddle = new Rotor KnownRotors.II
		rotorMiddle.setPosition "A"
		
		rotorLeft = new Rotor KnownRotors.I
		rotorLeft.setPosition "A"

		rotorDeck = new RotorDeck reflector, rotorLeft, rotorMiddle, rotorRight

	it 'should return I, if A is passed', ->
		result = rotorDeck.encrypt("A")
		expect(result).toBe "I"
	it 'should return A, if I is passed', ->
		result = rotorDeck.encrypt("I")
		expect(result).toBe "A"
	it 'should return B, if F is passed', ->
		result = rotorDeck.encrypt("F")
		expect(result).toBe "B"
	it 'should return F, if B is passed', ->
		result = rotorDeck.encrypt("B")
		expect(result).toBe "F"

describe "reflector deck. setup - reflector A, rotor right - III, rotor middle - II, rotor left - I, initial position: AAB", ->
	reflector = null
	rotorRight = null
	rotorMiddle = null
	rotorLeft = null
	rotorDeck = null

	beforeEach ->
		reflector = new Reflector KnownReflectors.A
		
		rotorRight = new Rotor KnownRotors.III
		rotorRight.setPosition "B"
		
		rotorMiddle = new Rotor KnownRotors.II
		rotorMiddle.setPosition "A"
		
		rotorLeft = new Rotor KnownRotors.I
		rotorLeft.setPosition "A"

		rotorDeck = new RotorDeck reflector, rotorLeft, rotorMiddle, rotorRight

	it 'should return G, if A is passed', ->
		result = rotorDeck.encrypt "A"
		expect(result).toBe "G"
	it 'should return T, if B is passed', ->
		result = rotorDeck.encrypt "B"
		expect(result).toBe "T"

describe "RotorDeck::advanceRotors()", ->
	reflector = null
	rotorRight = null
	rotorMiddle = null
	rotorLeft = null
	rotorDeck = null

	beforeEach ->
		reflector = new Reflector KnownReflectors.A
		
		rotorRight = new Rotor KnownRotors.III, true
		rotorRight.setPosition "A"
		
		rotorMiddle = new Rotor KnownRotors.II, true
		rotorMiddle.setPosition "A"
		
		rotorLeft = new Rotor KnownRotors.I, true
		rotorLeft.setPosition "A"

		rotorDeck = new RotorDeck reflector, rotorLeft, rotorMiddle, rotorRight

	it 'should turn from AAA to AAB', ->
		rotorDeck.advanceRotors()
		result = rotorDeck.rotorLeft.getPosition() + rotorDeck.rotorMiddle.getPosition() + rotorDeck.rotorRight.getPosition()
		expect(result).toBe "AAB"

	it 'should turn from AAB to  AAC', ->
		rotorDeck.rotorRight.setPosition "B"
		rotorDeck.advanceRotors()
		result = rotorDeck.rotorLeft.getPosition() + rotorDeck.rotorMiddle.getPosition() + rotorDeck.rotorRight.getPosition()
		expect(result).toBe "AAC"
		
	it 'should turn from AAV to ABW', ->
		rotorDeck.rotorLeft.setPosition "A"
		rotorDeck.rotorMiddle.setPosition "A"
		rotorDeck.rotorRight.setPosition "V"
		rotorDeck.advanceRotors()
		result = rotorDeck.rotorLeft.getPosition() + rotorDeck.rotorMiddle.getPosition() + rotorDeck.rotorRight.getPosition()
		expect(result).toBe "ABW"
	
