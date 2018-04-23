
$(document).ready(function(){
  $(".waiting").click(function(event){
    $(this).hide();
    $(".loader-container").removeClass("hidden").html("<div class='loader'></div>");
  })

  $(".paid").click(function(){
    $(".action-links").addClass("hidden");
    $(".loader-container").removeClass("hidden").html("<div class='loader'></div>");
  })


})
