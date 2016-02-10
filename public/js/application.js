// Wait till the browser is ready to render the game (avoids glitches)
window.requestAnimationFrame(function () {
  var game = new GameManager(4, KeyboardInputManager, HTMLActuator, ApiStorageManager);

  $.ajax({
    method: "GET",
    url: "/games/get_user",
  })
  .done(function(data) {
    $.ajax({
      method: "GET",
      url: "/load_games",
      data: {user_id: data.id}
    })
    .done(function(response) {
      for (i=0; i < response.length; i++) {
        $("#game-list").append("<li><a class='load_game_button' data-id='"+ response[i].id + "' href='javascript:void(0)'>" + response[i].created_at + "</a></li>");
      }
      $(".load_game_button").click(function(){
        // needs game id, and call setup(state)
        console.log(this.attributes[1].value)
        var id = this.attributes[1].value;
        $.ajax({
          method: "GET",
          url: "/retrieve_game",
          data: {game_id: id}
        })
        .done(function(response) {
          console.log(response.state);
          game.setup(response.state);
        });

      });
    });
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
      $.ajax({
        method: "GET",
        url: "/load_games",
        data: {user_id: data.id}
      })
      .done(function(response) {
          $("#game-list").append("<li><a class='load_game_button' data-id="+ response[(response.length)-1].id + "href='javascript:void(0)'>" + response[(response.length)-1].created_at + "</a></li>");
      });
    });

  });

  // $(".load_game_button").click(function(){
  //   // needs game id, and call setup(state)
  //   var datathing = this.attr();
  //   console.log(datathing);
  // });

});
