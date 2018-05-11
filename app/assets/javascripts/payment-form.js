$(document).ready(function(){
  $(".display-card").click(function(){
    $(".stripe-button-el").click();
  })

  paymentClick();

})


function paymentClick(){
  $(".new-user-book").click(function(){
    $(".update-delivery-infos").click();

    var firstName = $("#address_first_name").val();
    var lastName = $("#address_last_name").val();
    var addressStreet = $("#address_street").val();
    var zipCode = $("#address_zip_code").val();
    var city = $("#address_city").val();

    if (firstName == "" || lastName == "" ) {
      $(".fa.fa-user").css({ 'color': 'red', 'border-color': 'red' });
    } else {
      $(".fa.fa-user").removeAttr('style');
    } if (address_street == "" || zipCode == "" || city == "" ) {
      $(".fa.fa-truck").css({ 'color': 'red', 'border-color': 'red' });
    } else {
      $(".fa.fa-truck").removeAttr('style');
    }

     if (firstName != "" && lastName != "" && address_street != "" && zipCode != "" && city != "" ) {
      $(".stripe-button-el").click();
    }
  })
}


