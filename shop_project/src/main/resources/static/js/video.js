document.addEventListener("DOMContentLoaded", function() {
    // Get the video element
    var video = document.getElementById("myVideo");

    // Disable video controls
    video.controls = false;

    // Play the video automatically
    video.play();
});