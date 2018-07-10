
$(document).ready(function() {
  var target = $('#start-pick');
  var counter = $(".counter");
  var totalcounter = $(".totalcounter");
  setCounterValueAndAction(target, counter);
  setCounterValueAndActionTotal(target, totalcounter);

  });




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


function countToTotal(target, totalcounter) {
  var target = $(target).val();
  $(totalcounter).each(function() {
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
        var finish = (this.countNum + 3.9).toString() + " " + "€";
        $this.text(finish);
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

function setCounterValueAndActionTotal(target, totalcounter) {
  $(target).on('keyup', function(event) {
    if (event.keyCode == 8) {
      if ($(target).val() == "") {
        $(totalcounter).html("€");
      }
      else {
        var newTarget = $(target).val();
        $(totalcounter).html(newTarget);
      }
    }
    else if (event.keyCode != 13) {
      $(totalcounter).html("");
      var newCounter = $(totalcounter);
      countToTotal(target, newCounter);
    }
  })
}



