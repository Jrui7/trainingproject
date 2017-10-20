$.attachinary.config.template = '\
  <ul>\
    <% for(var i=0; i<files.length; i++){ %>\
      <li>\
        <% if(files[i].resource_type == "raw") { %>\
          <div class="raw-file"></div>\
        <% } else { %>\
          <img\
            src="<%= $.cloudinary.url(files[i].public_id, { "version": files[i].version, "format": "jpg", "crop": "fill", "width": 250, "height": 250 }) %>"\
            alt="" width="100" height="100" />\
        <% } %>\
        <a href="#" class="data-remove-link" data-remove="<%= files[i].public_id %>"><i class="md md-clear md-2x"></i></a>\
      </li>\
    <% } %>\
  </ul>\
';

$(document).ready(function() {
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
