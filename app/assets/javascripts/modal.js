$(document).ready(function(){
  $('#lostModal').on('shown.bs.modal', function() {
    setTimeout(function() { $('#forgot-email').focus() }, 1000);
  });

  $('#myModal').on('shown.bs.modal', function() {
    setTimeout(function() { $('#start-pick').focus() }, 1000);
  });

})
