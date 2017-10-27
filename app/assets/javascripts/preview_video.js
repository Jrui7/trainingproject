$(document).ready(function(){
  videoHandler()
  $("#seed_url").val()
});

function videoHandler() {
  $('#seed_url').on('keyup', function(event) {
    if (event.keyCode == 86) {
      // user pasted a video URL, generate video preview
    }
    if (event.keyCode == 8) {
      if ($('#post_video_url').val() == "") {
        // user cleared a video URL, remove video preview
      }
    }
  })
}

function clearMediaPreview() {
 $('.video-preview').html('')
}
