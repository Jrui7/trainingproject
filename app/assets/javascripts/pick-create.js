
$(document).ready(function() {

  $(".pick").on('keyup', function(event) {
    var target = $(this);
    var counter = $(".counter");
    var totalcounter = $(".totalcounter");
    setCounterValueAndAction(target, counter);
    setCounterValueAndActionTotal(target, totalcounter);

  });

  $(".edit-pick").on('keyup', function(event) {
    var id = parseInt((this.id));
    var target = $(this);
    var counter = $('#counter-' + id);
    var totalcounter  = $('#total-counter-' + id);

  });


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
        var finish = (this.countNum);
        $this.text(finish);
      }
    });
  });
}


function countToTotal(target, totalcounter) {
  var delivery = document.getElementById("cost-input").innerHTML;
  var delivery_costs = parseFloat(delivery);
  var input = parseFloat(target.val()) + delivery_costs
  var target = input.toFixed(2)
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
        var finish = (this.countNum);
        $this.text(finish);
      }
    });
  });
}

function setCounterValueAndAction(target, counter) {
  $(target).on('keyup', function(event) {
    if (event.keyCode == 8) {
      if ($(target).val() == "") {
        $(counter).html("");
      }
      else {
        $(counter).html(0);
        var newCounter = $(counter);
        countTo(target, newCounter);
      }
    }
    else if (event.keyCode != 13) {
      $(counter).html(0);
      var newCounter = $(counter);
      countTo(target, newCounter);
    }
  })
}

function setCounterValueAndActionTotal(target, totalcounter) {
  $(target).on('keyup', function(event) {
    if (event.keyCode == 8) {
      if ($(target).val() == "") {
        $(totalcounter).html("");
      }
      else {
        $(totalcounter).html(0);
        var newCounter = $(totalcounter);
        countToTotal(target, newCounter);
      }
    }
    else if (event.keyCode != 13) {
      $(totalcounter).html(0);
      var newCounter = $(totalcounter);
      countToTotal(target, newCounter);
    }
  })
}



