$ = jQuery
class blockUI
	constructor: () ->
		@display = (path, deck) ->
			$.blockUI { 
				message: $('<div id="canvas"></div>') 
				css: { 
	                width: '800px',
	                top: '50px', 
	                left: '100px',
	                border: 'none', 
	                padding: '5px', 
	                backgroundColor: '#FFF', 
	                '-webkit-border-radius': '10px', 
	                '-moz-border-radius': '10px', 
	                opacity: .9, 
	                color: '#CCC' 
            	}
			}
			$('.blockOverlay').click(
				$.unblockUI
			);
			an = new animate "canvas"
			an.play path, deck

@blockUI = blockUI