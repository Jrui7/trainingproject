
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
    $(".with_customer_id").hide();
  })
}

function directPayment() {
  $("#with_customer_id").click(function(){
    var firstName = $("#address_first_name").val();
    var lastName = $("#address_last_name").val();
    var addressStreet = $("#address_street").val();
    var zipCode = $("#address_zip_code").val();
    var city = $("#address_city").val();

    if (firstName == "" || lastName == "" ) {
      $(".fa.fa-user").css({ 'color': 'red', 'border-color': 'red' });
    } else {
      $(".fa.fa-user").removeAttr('style');
    } if (addressStreet == "" || zipCode == "" || city == "" ) {
      $(".fa.fa-truck").css({ 'color': 'red', 'border-color': 'red' });
    } else {
      $(".fa.fa-truck").removeAttr('style');
    }

     if (firstName != "" && lastName != "" && addressStreet != "" && zipCode != "" && city != "" ) {
      $("#with_customer_id").addClass("hidden");
      $(".loader-container").removeClass("hidden").html("<div class='loader'></div>");
      $(".update-delivery-infos").click();
      $("#save-and-book").click();
    }
  })
}

