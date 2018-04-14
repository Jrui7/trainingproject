$(document).ready(function(){
  connexion();
})


function connexion() {
  $(".connect-button").click(function(){
      $(".go-to-link").hide()
      $(".connect-button").toggle();
      $(".log-in-home").removeClass("hidden");
  });

}
