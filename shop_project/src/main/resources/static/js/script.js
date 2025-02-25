$(document).ready(function(){
  var currentPosition = parseInt($(".quickmenu").css("top"));
  $(window).scroll(function() {
    var position = $(window).scrollTop(); 
    $(".quickmenu").stop().animate({"top":position+currentPosition+"px"},1000);
  });
  
  $('#upBtn').on('click',function(){
	$('html, body').animate({scrollTop: '0'}, 680);
  })
  $('#review').on('click',function(){
	$(location).attr("href", "http://localhost:8080/NonMajor5/community.html")
  })
});