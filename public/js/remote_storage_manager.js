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
  // var stateJSON = this.storage.getItem(this.gameStateKey);
  return stateJSON = {"grid":{"size":4,"cells":[[{"position":{"x":0,"y":0},"value":2048},{"position":{"x":0,"y":1},"value":8},null,{"position":{"x":0,"y":3},"value":2}],[{"position":{"x":1,"y":0},"value":4},{"position":{"x":1,"y":1},"value":8},{"position":{"x":1,"y":2},"value":32},null],[{"position":{"x":2,"y":0},"value":2},{"position":{"x":2,"y":1},"value":8},{"position":{"x":2,"y":2},"value":2},{"position":{"x":2,"y":3},"value":4}],[{"position":{"x":3,"y":0},"value":8},{"position":{"x":3,"y":1},"value":2},{"position":{"x":3,"y":2},"value":32},{"position":{"x":3,"y":3},"value":4096}]]},"score":1000316,"over":false,"won":false,"keepPlaying":false}
  // return stateJSON ? JSON.parse(stateJSON) : null;
};

RemoteStorageManager.prototype.setGameState = function (gameState) {
  // this.storage.setItem(this.gameStateKey, JSON.stringify(gameState));
};

RemoteStorageManager.prototype.clearGameState = function () {
  // this.storage.removeItem(this.gameStateKey);
};
