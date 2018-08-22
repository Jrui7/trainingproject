$(document).ready(function(){
  var form = document.getElementById('new_seed');
  if(form) {
    form.addEventListener('submit', function(event) {
       event.preventDefault();
       var photo = $(".attachinary_container").children('input').first();
       if( !$(photo).val() ) {
          $(".chooseFile").addClass("shake").css({ 'color': 'red',});
        }
        else {
          form.submit();
        }
    })
  }


})

