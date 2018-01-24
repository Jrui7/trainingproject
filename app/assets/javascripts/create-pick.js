$(document).ready(function() {
  var target = $('#start-pick');
  var counter = $(".counter");
  setCounterValueAndAction(target, counter);

  });


function counter() {
  $('#start-pick').on('keyup', function(event) {
    if (event.keyCode == 8) {
      if ($('#start-pick').val() == "") {
        $('.counter').html("€");
      }
    }
    else if (event.keyCode != 13) {
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

function countTo(target, counter) {
  var target = $(target).val();
  $(counter).each(function() {
    var $this = $(this),
      countTo = target;
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

function setCounterValueAndAction(target, counter) {
  $(target).on('keyup', function(event) {
    if (event.keyCode == 8) {
      if ($(target).val() == "") {
        $(counter).html("€");
      }
      else {
        var newTarget = $(target).val();
        $(counter).html(newTarget);
      }
    }
    else if (event.keyCode != 13) {
      $(counter).html("");
      var newCounter = $(counter);
      countTo(target, newCounter);
    }
  })
}



// compter si retour arrière et valeur != ""

// compter si keyup != retour arrière et enter

// clear counter si keyup == retour arrière et val == ""




