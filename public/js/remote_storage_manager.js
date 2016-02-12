window.fakeStorage = {
  _data: {},

  setItem: function (id, val) {
    return this._data[id] = String(val);
  },

  getItem: function (id) {
    return this._data.hasOwnProperty(id) ? this._data[id] : undefined;
  },

  removeItem: function (id) {
    return delete this._data[id];
  },

  clear: function () {
    return this._data = {};
  }
};

function RemoteStorageManager() {
  this.bestScoreKey     = "bestScore";
  this.gameStateKey     = "gameState";

  var supported = this.remoteStorageSupported();
  this.storage = supported ? window.localStorage : window.fakeStorage;
}

RemoteStorageManager.prototype.remoteStorageSupported = function () {
  var testKey = "test";
  var storage = window.localStorage;

  try {
    storage.setItem(testKey, "1");
    storage.removeItem(testKey);
    return true;
  } catch (error) {
    return false;
  }
};

// Best score getters/setters
RemoteStorageManager.prototype.getBestScore = function () {
  return this.storage.getItem(this.bestScoreKey) || 0;
};

RemoteStorageManager.prototype.setBestScore = function (score) {
  this.storage.setItem(this.bestScoreKey, score);
};

// Game state getters/setters and clearing
RemoteStorageManager.prototype.getGameState = function () {
  var stateJSON;
  var userID = $(".user-id").text();
  var gameID = $(".game-id").text();
  var url = "/users/" + userID + "/game/" + gameID + ".json";
    $.ajax(url, {
      method: "GET",
      async: false
    })
      .done(function(data) {
        stateJSON = data;
      })
      .fail(function(){
      })
      .always(function(){
      });
  if (stateJSON) {
    stateJSON.board_state = JSON.parse(stateJSON.board_state);
  }
  return stateJSON;
};

RemoteStorageManager.prototype.setGameState = function (gameState) {
  this.storage.setItem(this.gameStateKey, JSON.stringify(gameState));
};

RemoteStorageManager.prototype.clearGameState = function () {
  this.storage.removeItem(this.gameStateKey);
};
