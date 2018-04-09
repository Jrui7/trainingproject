$(document).ready(function(){

  $("#seed_category_id").change(function(){
    var userInput = $(this).val();
    console.log(userInput);
    var modeId = $(this).data('mode-category-id');
    console.log(modeId);

    if (userInput == modeId) {
      console.log("envoyez nous un mail avec le code HD4TZ et recevez un petit cadeau de notre part");
      $(".size-guide-input").removeClass("hidden");
    } else {
      if (!$(".size-guide-input").hasClass('hidden')) {
        $(".size-guide-input").addClass("hidden");
      }
    }
  });
});
