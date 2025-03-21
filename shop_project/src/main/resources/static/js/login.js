/**
 *  login js
 */
 
$(function(){
	// 로그인
	$('#loginForm').on('submit', function(e){
		e.preventDefault();
		
		let id = $('#username').val();
		let password = $('#password').val();
		
		$.ajax({
			type: "POST",
			url: "/member/login",
			contentType: "application/json",
			data: JSON.stringify({
				"id": id,
				"pwd": password				
			}),
			dataType: "text",
			success: function(result){
				if(result == "success") {
					location.href = "/";
				}else {
					$('#errorMessage').text("아이디 또는 비밀번호가 일치하지 않습니다.");
                    $('#username').val("");
                    $('#password').val("");
				}
			},
			error: function(){
				alert("실패");
			}
		});
	});
	
	// 로그아웃
	$('#logoutBtn').on('click', function(){
		$.ajax({
			type: "POST",
			url: "/member/logout",
			success: function(result){
				if(result == "success") {
					location.href = "/";
				}
			},
			error: function(){
				alert("실패");
			}
		});
	});
});