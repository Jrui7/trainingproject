$(document).ready(function(){
  $("#edit-civil").click(function(){
    $("#profil-and-pen").hide();
    $(".form-civil").slideToggle();
  })

  $("#cancel-civil").click(function(){
    $(".form-civil").hide();
    $("#profil-and-pen").slideToggle();
  })

  $("#edit-address").click(function(){
    $("#address-and-pen").hide();
    $(".form-livraison").slideToggle();
  })

  $("#cancel-address").click(function(){
    $(".form-livraison").hide();
    $("#address-and-pen").slideToggle();
  })

  $("#edit-password").click(function(){
    $("#password-and-pen").hide();
    $(".form-password").slideToggle();
  })

  $("#cancel-password").click(function(){
    $(".form-password").hide();
    $("#password-and-pen").slideToggle();
  })

  $("#edit-paiement").click(function(){
    $(".stripe-button-el").click();
  })




})
