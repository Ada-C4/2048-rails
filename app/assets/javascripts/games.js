$(document).ready(function(){
  $(".resume-link").on("click", function(){
    var gameID = $(this).data("id");
    // make a new LocalStorageManager and save to variable
    var storageManager = new LocalStorageManager;
    // call the setID function on the LocalStorageManager instance
    storageManager.saveID(gameID);
  });
});
