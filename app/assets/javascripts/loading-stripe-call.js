
$(document).ready(function(){

directPayment();
// newCardPayment();
displayForm();
deletePaidPick();

})

function deletePaidPick() {
  $(".paid").click(function(){
    $(".action-links").addClass("hidden");
    $(".loader-container").removeClass("hidden").html("<div class='loader'></div>");
  })
}

function displayForm() {
  $(".display-card").click(function(){
    $("#update-customer-stripe").slideToggle();
    $("#payment-form").removeClass("hidden");
    $(".with_customer_id").addClass("hidden");
  })
}

function directPayment() {
  $("#with_customer_id").click(function(){
    var firstName = $("#address_first_name").val();
    var lastName = $("#address_last_name").val();
    var addressStreet = $("#address_street").val();
    var zipCode = $("#address_zip_code").val();
    var city = $("#address_city").val();

    if (firstName == "" || lastName == "" || addressStreet == "" || zipCode == "" || city == "" ) {
      if ($(".fa.fa-user").hasClass("shake")) {
        $(".fa.fa-user").removeClass("shake");
      }
      if ($(".fa.fa-truck").hasClass("shake")) {
        $(".fa.fa-truck").removeClass("shake");
      }
      $("#go-to-form").click();
    }

    if (firstName == "" || lastName == "" ) {
        setTimeout(function(){
          $(".fa.fa-user").addClass("shake").css({ 'color': 'red', 'border-color': 'red' });
      }, 1000);
    } else {
      $(".fa.fa-user").removeAttr('style');
    } if (addressStreet == "" || zipCode == "" || city == "" ) {
        setTimeout(function(){
          $(".fa.fa-truck").addClass("shake").css({ 'color': 'red', 'border-color': 'red' });
      }, 1000);
    } else {
      $(".fa.fa-truck").removeAttr('style');
    }

     if (firstName != "" && lastName != "" && addressStreet != "" && zipCode != "" && city != "" ) {
      $("#with_customer_id").addClass("hidden");
      $(".loader-container").removeClass("hidden").html("<div class='loader'></div>");
      $(".update-delivery-infos").click();
      setTimeout(function(){
      $("#save-and-book").click();
    }, 1000);

    }
  })
}

