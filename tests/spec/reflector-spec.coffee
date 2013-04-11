#for inspiration: http://pivotal.github.io/jasmine/
describe "reflector type A", ->
	reflector = new Reflector KnownReflectors.A

	it 'should return E, if A is passed', ->
		result = reflector.getOutput("A")
		expect(result).toBe "E"

	it 'should return Z, if D is passed', ->
		result = reflector.getOutput("D")
		expect(result).toBe "Z"

	it 'should return D, if Z is passed', ->
		result = reflector.getOutput("Z")
		expect(result).toBe "D"	

	it 'should not return E, if Z is passed', ->
		result = reflector.getOutput("Z")
		expect(result).not.toBe "E"

describe "reflector type B", ->
	reflector = new Reflector KnownReflectors.B

	it 'should return Y, if A is passed', ->
		result = reflector.getOutput("A")
		expect(result).toBe "Y"

	it 'should return H, if D is passed', ->
		result = reflector.getOutput("D")
		expect(result).toBe "H"

	it 'should return T, if Z is passed', ->
		result = reflector.getOutput("Z")
		expect(result).toBe "T"	

describe "reflector type C", ->
	reflector = new Reflector KnownReflectors.C

	it 'should return P, if C is passed', ->
		result = reflector.getOutput("C")
		expect(result).toBe "P"

	it 'should return I, if E is passed', ->
		result = reflector.getOutput("E")
		expect(result).toBe "I"

	it 'should return L, if Z is passed', ->
		result = reflector.getOutput("Z")
		expect(result).toBe "L"