class RotorDeck
	constructor: (@rotorsCollection, @reflector, @rotorLeft, @rotorMiddle, @rotorRight) ->
		events = {}

		#console.log(@["rotorLeft"])
		rotorDeck = $(@)
		that = @

		$(@rotorsCollection).find(".rotor_button").each(
			->
				$(@).on(
					'click'
					->
						rotorPosition = $(@).data('position')
						direction = $(@).data('direction')
						affectedRotor = that["rotor#{rotorPosition}"]

						rotorElement = $(@).closest('.rotor')
						ulElement = $(rotorElement).find('ul.rotor_letters')
						currentLetterItem = $(ulElement).find('.visible_letter')

						$(currentLetterItem).removeClass('visible_letter')

						if direction is 'F' #going forwards
							nextItem = $(currentLetterItem).next('li');
							if $(nextItem).length > 0
								$(nextItem).addClass('visible_letter')
							else #overflow happened
								$(ulElement).find('li:first-child').addClass('visible_letter')

							affectedRotor.advanceForward()
							console.log('FF')
						else if direction is 'B' #going backwards
							prevItem = $(currentLetterItem).prev('li');
							if $(prevItem).length > 0
								$(prevItem).addClass('visible_letter')
							else #overflow happened
								$(ulElement).find('li:last-child').addClass('visible_letter')

							affectedRotor.advanceBackward()
							console.log('BB')
				)
		)

		
		@rotorRight.on(
			"turnover"
			-> rotorMiddle.advanceForward()
		)
		@rotorMiddle.on(
			"turnover"
			-> rotorLeft.advanceForward()
		)

		raiseEvent = (event, eventData) ->
			if events.hasOwnProperty(event)
				#log "Raising event '#{event}'"
				events[event].forEach (fn) ->
					if eventData
						fn.call(undefined, eventData)
					else
						fn.call(undefined)
					return
			return

		@on = (event, callback) ->
			if typeof callback isnt 'function'
				return
			if !events.hasOwnProperty(event)
				events[event] = []
			events[event].push(callback)
			return


		@encrypt = (char) ->
			result = rotorRight.getForwardChar char
			result = rotorMiddle.getForwardChar result
			result = rotorLeft.getForwardChar result
			result = reflector.getOutput result
			result = rotorLeft.getBackwardChar result
			result = rotorMiddle.getBackwardChar result
			result = rotorRight.getBackwardChar result
			raiseEvent 'characterEncrypted', {result: result}
			return result

		@advanceRotors = () ->
			rotorRight.advanceForward()
			return


@RotorDeck = RotorDeck

