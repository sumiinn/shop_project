/**
 *  signUp Js
 */
 
 $(function() { 
 	
 	$('#searchZipBtn').on('click', function() {
  		new daum.Postcode({
  			oncomplete:function(data) {
  				let address1 = "";
  				
  				// 도로명 주소인 경우
  				if(data.userSelectedType == 'R') {
  					address1 = data.roadAddress + "(" + data.bname + data.buildingName + ")";
  				}else { // 지번 주소인 경우
  					address1 = data.jibunAddress;
  				}
  			
  				// 입력란에 우편버오, 주소1 출력 
  				console.log(data.zonecode);
  				console.log(address1);
  				console.log()
  				document.getElementById('zipcode').value = data.zonecode;
  				document.getElementById('address1').value = address1;
  				
  				// address2에 입력 시 이미 입력되어 있는 값 삭제하고 포커스
  				let address2 = document.getElementById('address2');
  				address2.value = "";
  				address2.focus();
  			}  		
  		}).open();
  	});
  	
 	let idChk = false;
 	
  	$('#searchId').on('click', function(e){
		e.preventDefault();
		
		let memId = $('#username').val();
		
		if(memId == ""){
			alert("아이디를 입력 하세요.");
		} else if(memId.length > 10) {
			alert("아이디는 10글자를 초과하실 수 없습니다.");
		} else {
			$.ajax({
	 			type:"POST",
	 			url:"/member/idCheck", 
	 			contentType: "application/json",
	 			data : JSON.stringify({"memId": memId}), 
	 			dataType:'text', 
	 			success: function(result) {
	 				if(result == "success") {
	 					alert("사용 가능한 아이디입니다");
	 					idChk = true;
	 				} else {
	 					alert("사용할 수 없는 아이디입니다.");
	 					$('#username').val("");
	 				}
	 			},
	 			error: function() {
	 				alert("실패");
	 			}
	 		});
		}
  	
  	})
  	
  	$('#submitBtn').on('click', function(e) {
		e.preventDefault();
		
		let pwd = $('#password').val();
		let pwdC = $('#passwordCheck').val();
		
		if(idChk == false){
			alert("아이디 중복체크가 필요 합니다.")
		}else if(pwd != pwdC){
			alert("비밀번호가 일치하지 않습니다.")			
		}else{
			$.ajax({
				type: "POST",
				url: "/member/join",
				contentType: "application/json",
				data: JSON.stringify({
					memId: $('#username').val(),
					memPw: $('#password').val(),
					memName: $('#name').val(),
					memEmail: $('#email').val(),
					memHP: $('#hp1').val() + '-' + $('#hp2').val() + '-' + $('#hp3').val(),
					memZipcode: $('#zipcode').val(),
					memAddress1: $('#address1').val(),
					memAddress2: $('#address2').val()
				}),
				dataType: "text",
				success: function(result){
					if(result == "success") {
						location.href = "/member/loginForm";
					}else {
						alert("회원가입에 실패하였습니다.");
					}
				},
				error: function(){
					alert("실패");
				}
			});
		}
	});	
 });