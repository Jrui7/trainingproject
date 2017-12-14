$(document).ready(function() {
  $("#seed_sale_point_internet").click(function() {
    $(".internet").removeClass("hidden");
    $(".official_description").removeClass("hidden");
    if(!$(".traditional").hasClass("hidden")){
        $(".traditional").addClass("hidden");
     }
    if($(".help-us").hasClass("cache")){
      $('.help-us').toggleClass("cache montre");
     }
  });

  $("#seed_sale_point_traditional").click(function() {
    $(".traditional").removeClass("hidden");
    $(".official_description").removeClass("hidden");
    if(!$(".internet").hasClass("hidden")){
        $(".internet").addClass("hidden");
     }
    if($(".help-us").hasClass("cache")){
      $('.help-us').toggleClass("cache montre");
     }

  });

  $(".chooseVideo").click(function() {
    $(".video-block").toggleClass("hidden");
    $(".video-container").toggleClass("cache montre");
  });

});
