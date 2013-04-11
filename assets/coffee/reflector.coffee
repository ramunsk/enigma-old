class Reflector
	constructor: (@reflectorType) ->
		@getOutput = (@input) ->
			pos = reflectorType.in.indexOf input
			reflectorType.out.substring pos, pos + 1

#refl = new Reflector KnownReflectors.C
#alert refl.getOutput("Z")