/**
 *  findId js
 */
 
 $(function(){
 	$('.btnL').on('click',function(){
 		event.preventDefault();
 		
 		let memName = $('#memName').val();
 		let memEmail = $('#memEmail').val();
 		
 		if(memName == ""||memEmail == ""){
 			alert("이름과 이메일을 모두 입력해 주세요");
 		}else{
 			$.ajax({
	 			type: "POST",
	 			url: "/member/findId",
	 			contentType: "application/json",
	 			data: JSON.stringify({
	 				"memName": memName,
	 				"memEmail": memEmail	 			
	 			}), 
	 			success:function(memId){
	 				$('#resultMemId').text(memId);
	                $('#resultArea').show();
	 			},
	 			error:function(xhr){
	 				if(xhr.status == 404) {
	 					$('#errorMessage').text("아이디가 존재하지 않습니다.");
	 				} else {
	 					$('#errorMessage').text("서버 오류 발생");
	 				}
	 				
	 			}
	 		});
 		}
 	});
 });