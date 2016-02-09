function RemoteStorageManager() {
  // set the game ID?????
}

// Best score getters/setters
RemoteStorageManager.prototype.getBestScore = function () {
  return this.storage.getItem(this.bestScoreKey) || 0;
  // make an API call and return the best score from the JSON
  // return something || 0
};

RemoteStorageManager.prototype.setBestScore = function (score) {
  this.storage.setItem(this.bestScoreKey, score);
};

// Game state getters/setters and clearing
RemoteStorageManager.prototype.getGameState = function () {
  var stateJSON = this.storage.getItem(this.gameStateKey);
  return stateJSON ? JSON.parse(stateJSON) : null;
};

RemoteStorageManager.prototype.setGameState = function (gameState) {
  this.storage.setItem(this.gameStateKey, JSON.stringify(gameState));
};

RemoteStorageManager.prototype.clearGameState = function () {
  this.storage.removeItem(this.gameStateKey);
};
