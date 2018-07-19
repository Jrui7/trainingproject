$.attachinary.config.template = '\
    <% for(var i=0; i<files.length; i++){ %>\
        <% if(files[i].resource_type == "raw") { %>\
          <div class="raw-file"></div>\
        <% } else { %>\
          <% $(".no-photo").hide(); %>\
          <div class="picture-upload">\
            <img\
              src="<%= $.cloudinary.url(files[i].public_id, { "version": files[i].version, "format": "jpg", "crop": "fill", "width": 250, "height": 250 }) %>"\
              alt="" width="150" height="150" />\
            <a href="#" data-remove="<%= files[i].public_id %>" class="glyphicon glyphicon-remove"></a>\
          </div>\
        <% } %>\
    <% } %>\
';

$(document).ready(function() {

  updateUserPhoto();

  $(".chooseFile").click(function() {
      $("#seed_photos").click();
      $(".input-block.attach").removeClass("hidden");

  });


  $('.attachinary-input').bind('fileuploaddone', function (event) {
    $(this).addClass('has-file');
    $(this).siblings('.attachinary_container').removeClass('loading');
  });

  $('.attachinary-input').bind('fileuploadstart', function (event) {
    $(this).siblings('.attachinary_container').addClass('loading');
  });

  $('.form-group.attachinary').on('click', function (event) {
    $(this).find('.attachinary-input').removeClass('has-file');
  });
});


function updateUserPhoto() {
    $(".choosePhoto").click(function() {
        $(".glyphicon.glyphicon-remove").click();
        $(".no-photo").hide();
        $(".photo-update").prepend("<div class='no-photo'></div>");
        $("#user_photo").click();
        $(".btn-cancel").removeClass('hidden');
    });
  }


