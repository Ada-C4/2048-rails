// Wait till the browser is ready to render the game (avoids glitches)
window.requestAnimationFrame(function () {
  var game = new GameManager(4, KeyboardInputManager, HTMLActuator, LocalStorageManager);
  function loadGameClickHandler(){
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
  }
  // load saved games
  $.ajax('/games')
    .done(function(htmlRes){
      $('#saved-games').html(htmlRes);
      // bind load game handler to loadgame links
      $('.loadGame').click(loadGameClickHandler);
    })
    .fail(function(){
      console.log('show user saved games: fail', html);
    });
  // load leaderboard html into leaderboard div
  function loadLeaderboard(){
    $.ajax('/topgames')
    .done(function(htmlRes){
      $('#leaderboard').html(htmlRes);
    })
    .fail(function(){
      console.log('load leaderboard: fail', html);
    });  
  }
  // update leaderboard every 3 seconds
  loadLeaderboard();
  window.setInterval(loadLeaderboard, 3000);
});
