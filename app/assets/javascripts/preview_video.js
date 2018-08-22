$(document).ready(function() {

  $(".chooseVideo").click(function() {
      $(".video-block").slideToggle();
    });
  videoHandler();
});

function getVideoUrl() {
  var userInput = $("#seed_url").val();
  return userInput;
}

function clearVideoPreview() {
  $('#iframe').attr('src', '');
}

function parseVideoUrl(videoUrl) {
  var id = videoUrl.replace("https://www.youtube.com/watch?v=", "");
  var url = 'https://www.youtube.com/embed/' + id;
  console.log(url);
  return url;
}

function showVideoPreview(url) {
  $('#iframe').attr('src', url);
}

function videoHandler() {
  $('#seed_url').on('keyup', function(event) {
    if (event.keyCode == 86 || event.keyCode == 91) {
      clearVideoPreview();
      var videoUrl = $('#seed_url').val();
      var videoId = parseVideoUrl(videoUrl);
      showVideoPreview(videoId);
    }

    if (event.keyCode == 8) {
      if ($('#seed_url').val() == "") {
        clearVideoPreview();
      }
    }
  })
}





