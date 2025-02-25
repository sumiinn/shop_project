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
	 			type:"post",
	 			url:"/member/findId",
	 			data:{"memName":memName,
	 				  "memEmail":memEmail},
	 			dateType:'text', 
	 			success:function(memId){
	 				if(memId == "") {
	 					alert("일치하는 아이디가 없습니다.");
	 				} else {
	 					$('#loginForm').submit();;
	 				}
	 			},
	 			error:function(){
	 				alert("실패");
	 			}
	 		});
 		}
 	})
 })