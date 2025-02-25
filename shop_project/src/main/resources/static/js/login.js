/**
 *  login js
 */
 
  $(function(){
  	$('#backButton').on('click',function(){
  		location.href= "/";
  	})
  	$('#loginForm').on('submit', function() {
		event.preventDefault();
	 	$.ajax({
 			type:"post",
 			url:"/member/login", 
 			data : {"id":$('#username').val(),
 						"pwd": $('#password').val()}, /* 컨트롤러에서 받는 이름 id, pwd  */
 			dataType:'text', /* 요청하는 데이터 타입 (반환 타입) */
 			success:function(result) {
 				if(result == "success") {
 					location.href= "/";
 				} else {
 					alert("아이디 또는 비밀번호가 일치하지 않습니다");
 					$('#id').val("");
 					$('#pwd').val("");
 				}
 			},
 			error:function() {
 				alert("실패");
 			}
 		});
	});	
 });