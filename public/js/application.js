// Wait till the browser is ready to render the game (avoids glitches)
window.requestAnimationFrame(function () {
  var game = new GameManager(4, KeyboardInputManager, HTMLActuator, ApiStorageManager);

  $('#load-button').click(function() {

  });

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
    });
  });
});
