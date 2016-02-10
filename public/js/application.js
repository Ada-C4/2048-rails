// Wait till the browser is ready to render the game (avoids glitches)
window.requestAnimationFrame(function () {
  var game = new GameManager(4, KeyboardInputManager, HTMLActuator, ApiStorageManager);



  $("#save-button").click(function() {
    state = game.storageManager.storage.gameState;
    console.log("Hitting the right part of code");
    $.ajax({
      method: "GET",
      url: "/games/get_user",
    })
    .done(function(data) {
      console.log(data);
      $.ajax({
        method: "POST",
        url: "/users/" + data.id + "/create_game",
        data: { state: state}
      })
      .done(function(response) {
        console.log(response);
      });
      $.ajax({
        method: "GET",
        url: "/load_games",
        data: {user_id: data.id}
      })
      .done(function(response) {
          $("#game-list").append("<li><a href='#'>" + response[(response.length)-1].created_at + "</a></li>");
      });
    });

  });
});
