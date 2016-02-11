// Wait till the browser is ready to render the game (avoids glitches)
window.requestAnimationFrame(function () {
  new GameManager(4, KeyboardInputManager, HTMLActuator, LocalStorageManager);
  $.ajax('/games')
	    .done(function(htmlRes){
	      $('#saved-games').html(htmlRes);
	      // bind load game handler to loadgame links
	      $('.loadGame').click(loadGameClickHandler);
	    })
	    .fail(function(){
	      console.log('show user saved games: fail', html);
	    });
});
