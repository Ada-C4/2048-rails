// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require_tree .
$(document).ready(function() {
  $('#save').click(function(event) {
    event.preventDefault();

    var url = "/save";

    $.ajaxSetup({
      headers: {
        'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
      }
    });

    $.ajax(url, {
      type: "POST"
    })
      .done(function(data) {
        console.log(data);
        console.log("GAME SAVED");
      })
      .fail(function() {
        console.log("FAILED TO SAVE");
      })
      .always(function() {
        console.log("I always do this");
      });
  });
});
