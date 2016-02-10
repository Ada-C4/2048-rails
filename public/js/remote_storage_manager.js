function RemoteStorageManager() {
  this.gameID = 1;
}

// Best score getters/setters
RemoteStorageManager.prototype.getBestScore = function () {
  // return this.storage.getItem(this.bestScoreKey) || 0;
  // make an API call and return the best score from the JSON
  // return something || 0

  return "1000";
};

RemoteStorageManager.prototype.setBestScore = function (score) {
  // this.storage.setItem(this.bestScoreKey, score);
};

// Game state getters/setters and clearing
RemoteStorageManager.prototype.getGameState = function () {
  var url = "games/" + this.gameID
  return $.ajax(url, {});
};

RemoteStorageManager.prototype.setGameState = function (gameState) {
  // check the boolean on whether we planned to update game state immenently
  // if false then set boolean true then set timer for 10 seconds with a callback
  // that callback will do the AJAX call to save the game
  // and then set the boolean back to false when AJAX call finishes
  // if the timer was true to begin with, we do nothing

  // this.storage.setItem(this.gameStateKey, JSON.stringify(gameState));
};

RemoteStorageManager.prototype.clearGameState = function () {
  // this.storage.removeItem(this.gameStateKey);
};
