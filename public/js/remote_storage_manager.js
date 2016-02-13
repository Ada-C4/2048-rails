function RemoteStorageManager(game) {
  // this.userID = userID;
  this.gameID = game ? game.id : null;
  this.updating = false;
}

// Best score getters/setters
RemoteStorageManager.prototype.getBestScore = function () {
  var url = "bestscore/" + this.gameID;
  return $.ajax(url, {});
};

RemoteStorageManager.prototype.setBestScore = function (score) {
  // this.storage.setItem(this.bestScoreKey, score);
};

// Game state getters/setters and clearing
RemoteStorageManager.prototype.getGameState = function () {
  var url = "games/" + this.gameID;
  // var url = "users/" + this.userID;
  return $.ajax(url, {});
};

RemoteStorageManager.prototype.setGameState = function (gameState) {
  // check the boolean on whether we planned to update game state immenently
  // if false then set boolean true then
  // set timer for 10 seconds with a callback
  // that callback will do the AJAX call to save the game
  // and then set the boolean back to false when AJAX call finishes
  // if the timer was true to begin with, we do nothing

  console.log("Initiating AJAX POST for save state");
  var state = JSON.stringify(gameState);
  var url = "save/" + this.gameID;
  return $.ajax(url, {
    type: "POST",
    data: JSON.stringify({
      state: state, won: gameState.won,
      completed: gameState.over,
      score: gameState.score }),
    contentType: "application/json; charset=utf-8",
    dataType: "json",
  });
};

RemoteStorageManager.prototype.clearGameState = function (gameOver) {
  this.gameID = null;

  if (!gameOver) {
    var url = "new/";
    return $.ajax(url, {});
  }

  // this.storage.removeItem(this.gameStateKey);
};
