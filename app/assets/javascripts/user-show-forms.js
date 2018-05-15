$(document).ready(function(){
  $("#edit-civil").click(function(){
    $("#profil-and-pen").hide();
    $(".form-civil").slideToggle();
  })

  $("#cancel-civil").click(function(){
    $(".form-civil").slideToggle();
    $("#profil-and-pen").slideToggle();
  })

  $("#edit-address").click(function(){
    $("#address-and-pen").hide();
    $(".form-livraison").slideToggle();
  })

  $("#cancel-address").click(function(){
    $(".form-livraison").slideToggle();
    $("#address-and-pen").slideToggle();
  })

  $("#edit-password").click(function(){
    $("#password-and-pen").hide();
    $(".form-password").slideToggle();
  })

  $("#cancel-password").click(function(){
    $(".form-password").slideToggle();
    $("#password-and-pen").slideToggle();
  })

  $("#edit-paiement").click(function(){
    $(".form-card").slideToggle();
    $("#paiement-and-pen").slideToggle();
  })

  $("#cancel-card").click(function(){
    $(".form-card").slideToggle();
    $("#paiement-and-pen").slideToggle();
  })




})
