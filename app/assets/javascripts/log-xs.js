$(document).ready(function(){
  loadLogIn();
  loadSignUp();
  connexion();
})

function loadLogIn() {
  $("#sign-in").click(function(){
    $("#action-xs").hide();
    $(".form-xs").removeClass("hidden");
    $(".form-login-xs").removeClass("hidden");
  })
}

function loadSignUp() {
  $("#sign-up").click(function(){
    $("#action-xs").hide();
    $(".form-xs").removeClass("hidden");
    $(".form-sign-up-xs").removeClass("hidden");
  })
}

function connexion() {
  $(".connect-button").click(function(){
      $(".connect-button").toggle();
      $(".log-in-home").removeClass("hidden");
  });

}
