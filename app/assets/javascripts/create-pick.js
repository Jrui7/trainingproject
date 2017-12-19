$(document).ready(function() {
   $( "#start-pick" ).keyup(function() {
      var value = $( this ).val();

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
    })

  });
