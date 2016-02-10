// Wait till the browser is ready to render the game (avoids glitches)
window.requestAnimationFrame(function () {
  // new GameManager(4, KeyboardInputManager, HTMLActuator, LocalStorageManager)

  var url = "users/";
  $.ajax(url, {}).done(function(user) {
    console.log(user.id);
    new GameManager(4, KeyboardInputManager, HTMLActuator, RemoteStorageManager, user.id);
  });
});
