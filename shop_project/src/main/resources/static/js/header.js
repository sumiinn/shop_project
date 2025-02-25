/**
 * 
 */

$(function(){
	$('#mainMenuBox').hover(function(){
		$('#subMenuBox').removeClass("visibility")
	});
	$('#headMenu').hover(function(){
	},function(){
		$('#subMenuBox').addClass("visibility");
	});
	
	$('#menuLogoImg').on('click',function(){
		location.href="/"
	});
	
	var manuboxl =$('#headMenu').offset().top;
	
	$(window).scroll(function() {
	    var window = $(this).scrollTop();
	    if(manuboxl <= window) {
	      $("#headMenu").addClass("headerfixed");
	    }else{
	      $("#headMenu").removeClass("headerfixed");
	    }
  	})
});