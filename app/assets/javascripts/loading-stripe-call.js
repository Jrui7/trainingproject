
$(document).ready(function(){
  $(".btn.book.waiting").click(function(){
    $(".update-delivery-infos").click();
    var firstName = $("#address_first_name").val();
    var lastName = $("#address_last_name").val();
    var addressStreet = $("#address_street").val();
    var zipCode = $("#address_zip_code").val();
    var city = $("#address_city").val();

     if (firstName != "" &&  lastName != "" && address_street != "" && zipCode != "" && city != "" ) {
      $(this).hide();
      $(".loader-container").removeClass("hidden").html("<div class='loader'></div>");
      $("#save-and-book").click();
    }

    if (firstName == "" || lastName == "" ) {
      $(".fa.fa-user").css({ 'color': 'red', 'border-color': 'red' });
    }
    if (address_street == "" || zipCode == "" || city == "" ) {
      $(".fa.fa-truck").css({ 'color': 'red', 'border-color': 'red' });
    }



  })

  $(".paid").click(function(){
    $(".action-links").addClass("hidden");
    $(".loader-container").removeClass("hidden").html("<div class='loader'></div>");
  })
})
