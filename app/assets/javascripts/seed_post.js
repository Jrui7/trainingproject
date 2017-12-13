$(document).ready(function() {
  $("#seed_sale_point_internet").click(function() {
    $(".internet").removeClass("hidden");
    if(!$(".traditional").hasClass("hidden")){
        $(".traditional").addClass("hidden");
     }
    if($(".help-us").hasClass("cache")){
      $('.help-us').toggleClass("cache montre");
     }
  });

  $("#seed_sale_point_traditional").click(function() {
    $(".traditional").removeClass("hidden");
    if(!$(".internet").hasClass("hidden")){
        $(".internet").addClass("hidden");
     }
    if($(".help-us").hasClass("cache")){
      $('.help-us').toggleClass("cache montre");
     }

  });

  $("#add-video-button").click(function() {
    $(".video-container").removeClass("hidden");
  });

});
