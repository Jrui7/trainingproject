$(document).ready(function() {

   counter();

  });


function counter() {
  $('#start-pick').on('keyup', function(event) {
    if (event.keyCode == 8) {
      if ($('#start-pick').val() == "") {
        $('.counter').html("€");
      }
    }
    else {
      var value = $( this ).val();
        $('.counter').html("");
      $('.counter').each(function() {
      var $this = $(this),
          countTo = value;

      $({ countNum: $this.text()}).animate({
          countNum: countTo
        },

      {

        duration: 1500,
        easing:'linear',
        step: function() {
          $this.text(Math.floor(this.countNum));
        },
        complete: function() {
          $this.text(this.countNum);
        }

      });



      });
    }
  })
}



