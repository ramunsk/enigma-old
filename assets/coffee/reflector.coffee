class Reflector
	constructor: (@reflectorType, debug) ->

		log = (text) ->
			console.log text if debug and console.log
			return

		warn = (text) ->
			console.warn text if debug and console.warn
			return

		@getOutput = (@input) ->
			pos = reflectorType.in.indexOf input
			result = reflectorType.out.substring pos, pos + 1
			#log "#{@reflectorType.type}::getOutput #{@input} <-> #{result}"
			return result

@Reflector = Reflector