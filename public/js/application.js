// Wait till the browser is ready to render the game (avoids glitches)
window.requestAnimationFrame(function () {
  var game = new GameManager(4, KeyboardInputManager, HTMLActuator, LocalStorageManager);
  // Add click event handler for loading a game
	$(document).ready(function() {
		console.log('hello');
		// Bind the load game handler to clicking each load link
	  $('.loadGame').click(function(){
	    var url = "/game/" + $(this).data().gameid;
	    $.ajax(url, {
	      type: "POST"
	    })
	      .done(function(data) {
	        game.setup(data.gamestate);
	      })
	      .fail(function(data){
	        console.log("FAIL", data);
	      });
	  });

	  // Update the load game div every 1 second
	  setTimeout(function(){
	  	console.log(this);
	  	var loadUrl = 'abc';
	  	$.ajax(loadUrl, {
	  		type: "GET"
	  	})
	  		.done(function(){

	  		})
	  		.fail(function(){

	  		});
	  }, 1000);

	});
});
