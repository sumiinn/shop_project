document.addEventListener("DOMContentLoaded", function() {
    // Get all the slide images
    var slides = document.querySelectorAll("#slidePanel img");
    var currentSlide = 0;

    // Function to show the next slide
    function showNextSlide() {
        // Hide the current slide
         slides[currentSlide].style.display = "none";
        // Move to the next slide
        currentSlide = (currentSlide + 1 ) % slides.length;
        // Show the next slide
        slides[currentSlide].style.display = "block";
    }

    // Show the first slide
    slides[currentSlide].style.display = "block";

    // Set an interval to change slides every 5 seconds
    var slideInterval = setInterval(showNextSlide, 5000);
});