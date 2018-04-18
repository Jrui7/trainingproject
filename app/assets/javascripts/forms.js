$(document).ready(function(){
  $("#edit-civil").click(function(){
    $("#profil-and-pen").hide();
    $(".form-civil").slideToggle();
  })

  $("#cancel-civil").click(function(){
    $(".form-civil").hide();
    $("#profil-and-pen").show();
  })

  $(".livraison").click(function(){
    $(".form-livraison").slideToggle();
  })

  $(".password").click(function(){
    $(".form-password").slideToggle();
  })


})
