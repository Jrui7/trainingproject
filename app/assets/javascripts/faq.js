$(document).ready(function(){
  $(".regroup").click(
    function() {
       $(this).children('.problem').slideToggle();
    },
  );
})
