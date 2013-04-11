describe "rotor deck. setup - reflector A, rotor right - III, rotor middle - II, rotor left - I, initial position: AAA", ->
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

		rotorDeck = new RotorDeck null, reflector, rotorLeft, rotorMiddle, rotorRight

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

describe "rotor deck. setup - reflector A, rotor right - III, rotor middle - II, rotor left - I, initial position: AAB", ->
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

		rotorDeck = new RotorDeck null, reflector, rotorLeft, rotorMiddle, rotorRight

	it 'should return E, if A is passed', ->
		result = rotorDeck.encrypt "A"
		expect(result).toBe "E"
	it 'should return R, if B is passed', ->
		result = rotorDeck.encrypt "B"
		expect(result).toBe "R"

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

		rotorDeck = new RotorDeck null, reflector, rotorLeft, rotorMiddle, rotorRight

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
	
describe "rotor deck. encrypting: achtung", ->
	reflector = null
	rotorRight = null
	rotorMiddle = null
	rotorLeft = null
	rotorDeck = null

	beforeEach ->
		reflector = new Reflector KnownReflectors.A, true
		rotorRight = new Rotor KnownRotors.III, true
		rotorMiddle = new Rotor KnownRotors.II, true
		rotorLeft = new Rotor KnownRotors.I, true
		rotorDeck = new RotorDeck null, reflector, rotorLeft, rotorMiddle, rotorRight

	it 'encrypt/decrypt: ACHTUNG', ->
		word = "ACHTUNG"
		encrypt = (char) -> 
			result = rotorDeck.encrypt char
			console.log "#{char} -> #{result} | " + rotorDeck.rotorLeft.getPosition() + rotorDeck.rotorMiddle.getPosition() + rotorDeck.rotorRight.getPosition()
			rotorDeck.advanceRotors()
			return result

		console.log "============= Encrypt #{word} ==============="
		rotorRight.setPosition "A"
		rotorMiddle.setPosition "A"
		rotorLeft.setPosition "A"

		encryptedText = ''
		encryptedText += encrypt char for char in word.split ''
		
		console.log "============= Decrypt #{word} (scrambled) ==============="

		rotorRight.setPosition "A"
		rotorMiddle.setPosition "A"
		rotorLeft.setPosition "A"

		decryptedText = ''
		decryptedText += encrypt char for char in encryptedText.split ''

		expect(decryptedText).toBe word

	it 'encrypt/decrypt with right rotor turnover: ACHTUNG', ->
		word = "ACHTUNG"
		encrypt = (char) -> 
			result = rotorDeck.encrypt char
			console.log "#{char} -> #{result} | " + rotorDeck.rotorLeft.getPosition() + rotorDeck.rotorMiddle.getPosition() + rotorDeck.rotorRight.getPosition()
			rotorDeck.advanceRotors()
			return result

		console.log "============= Encrypt #{word} ==============="
		rotorRight.setPosition "T"
		rotorMiddle.setPosition "A"
		rotorLeft.setPosition "A"
		
		encryptedText = ''
		encryptedText += encrypt char for char in word.split ''
		
		console.log "============= Decrypt #{word} (scrambled) ==============="
		rotorRight.setPosition "T"
		rotorMiddle.setPosition "A"
		rotorLeft.setPosition "A"

		decryptedText = ''
		decryptedText += encrypt char for char in encryptedText.split ''
		
		expect(decryptedText).toBe word

	it 'encrypt/decrypt with right rotor + middle turnover: ACHTUNG', ->
		word = "ACHTUNG"
		encrypt = (char) -> 
			result = rotorDeck.encrypt char
			console.log "#{char} -> #{result} | " + rotorDeck.rotorLeft.getPosition() + rotorDeck.rotorMiddle.getPosition() + rotorDeck.rotorRight.getPosition()
			rotorDeck.advanceRotors()
			return result

		console.log "============= Encrypt #{word} ==============="
		rotorRight.setPosition "T"
		rotorMiddle.setPosition "D"
		rotorLeft.setPosition "A"
		
		encryptedText = ''
		encryptedText += encrypt char for char in word.split ''
		
		console.log "============= Decrypt #{word} (scrambled) ==============="
		rotorRight.setPosition "T"
		rotorMiddle.setPosition "D"
		rotorLeft.setPosition "A"

		decryptedText = ''
		decryptedText += encrypt char for char in encryptedText.split ''
		
		expect(decryptedText).toBe word