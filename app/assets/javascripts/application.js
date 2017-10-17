//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets

//= require jquery-fileupload/basic
//= require cloudinary/jquery.cloudinary
//= require attachinary

//= require owl.carousel

//= require_tree.

$( "#start" ).keyup(function() {
    var value = $( this ).val();


    $('.counter').each(function() {
    var $this = $(this),
        countTo = value;

    $({ countNum: 0}).animate({
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
  .keyup();


