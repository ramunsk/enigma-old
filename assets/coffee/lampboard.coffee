class Lampboard
	constructor: () ->
		currentChar = null

		@turnOff = ->
			if currentChar?
				warn "Lampboard UI not implemented"
				log "Turned off #{ currentChar }"
				currentChar = null
			return

		@turnOn = (char) ->
			@turnOff()
			warn "Lampboard UI not implemented"
			log "Turned on #{ currentChar }"
			currentChar = char
			return

		log = (text) ->
			console.log text if this.debug and console.log
			return

		warn = (text) ->
			console.warn text if this.debug and console.warn
			return


@.Lampboard = Lampboard