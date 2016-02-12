function RemoteStorageManager() {
  this.bestScoreKey     = "bestScore";
  this.gameStateKey     = "gameState";

  // var supported = this.localStorageSupported();
  this.storage = {};
}

// RemoteStorageManager.prototype.localStorageSupported = function () {
//   var testKey = "test";
//   var storage = window.localStorage;
//
//   try {
//     storage.setItem(testKey, "1");
//     storage.removeItem(testKey);
//     return true;
//   } catch (error) {
//     return false;
//   }
// };

// Best score getters/setters
// RemoteStorageManager.prototype.getBestScore = function () {
//   return 0;
// };

// RemoteStorageManager.prototype.setBestScore = function(score){
//   // this.storage.setItem(this.bestScoreKey, score);
// };

RemoteStorageManager.prototype.setGameState = function (gameState) {
  gameState.grid.cells = JSON.stringify(gameState.grid.cells)
  var url = "http://twentyforty8.herokuapp.com/gamesetups/";
  $.ajaxSetup({
    headers: {
      'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
    }
  });
  $.ajax({
    method: "POST",
    url: url,
    data: gameState,
    datatype: "json"
  })
    .done(function(data){
      $(".alert").append(
      '<div class="alert alert-success"><a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>Game successfully saved!</div>');
    });
};

RemoteStorageManager.prototype.clearGameState = function () {
  // this.storage.removeItem(this.gameStateKey);
};
