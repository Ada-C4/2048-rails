// Wait till the browser is ready to render the game (avoids glitches)
window.requestAnimationFrame(function () {
  var game = new GameManager(4, KeyboardInputManager, HTMLActuator, LocalStorageManager);
  // Add click event handler for loading a game
	$(document).ready(function() {
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
	});
});
