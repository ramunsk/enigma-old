$ = jQuery
class blockUI
	constructor: () ->
		@display2 = () ->
			$.blockUI { 
				message: $('<div id="canvas"></div>') 
				css: { 
	                width: '1200px',
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
			an.play()

@blockUI = blockUI