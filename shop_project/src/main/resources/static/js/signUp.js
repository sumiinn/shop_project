/**
 *  signUp Js
 */
 
 $(function() { 
 	let idch = false;
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
  	
  	$('#searchId').on('click',function(){
		event.preventDefault();
		let insertId = $('#username').val();
		if(insertId == ""){
			alert("아이디를 입력 하세요.");
		}else if(insertId.length > 10){
			alert("아이디는 10글자를 초과하실 수 없습니다.");
		}else{
			$.ajax({
	 			type:"post",
	 			url:"/member/idCheck", 
	 			data : {"memId": insertId}, 
	 			dataType:'text', 
	 			success:function(result) {
	 				if(result == "success") {
	 					alert("사용 가능한 아이디입니다");
	 					idch = true;
	 				} else {
	 					alert("사용할 수 없는 아이디입니다.");
	 				}
	 			},
	 			error:function() {
	 				alert("실패");
	 			}
	 		});
		}
  	
  	})
  	
  	/*else{
			location.href="/member/insertmem";
		}*/
  	$('#submitBtn').on('click', function() {
		event.preventDefault();
		let pwV = $('#password').val();
		let pwVC = $('#passwordCheck').val();
		
		if(idch ==false){
			alert("아이디 중복체크가 필요 합니다.")
		}else if(pwV !=pwVC){
			alert("비밀번호가 같지 않습니다.")			
		}else{
			$('#signupForm').submit();
		}
	});	
 });