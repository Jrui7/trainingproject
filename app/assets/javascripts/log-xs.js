$(document).ready(function(){
  connexion();
})


function connexion() {
  $(".connect-button").click(function(){
      $(".connect-button").toggle();
      $(".log-in-home").removeClass("hidden");
  });

}
