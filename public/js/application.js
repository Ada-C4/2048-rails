// Wait till the browser is ready to render the game (avoids glitches)
window.requestAnimationFrame(function () {
  // new GameManager(4, KeyboardInputManager, HTMLActuator, LocalStorageManager)
  var url = "users";
  $.ajax(url, {}).done(function(game) {
    console.log(game);
    new GameManager(
      4,
      KeyboardInputManager,
      HTMLActuator,
      RemoteStorageManager,
      game);
  });
});
