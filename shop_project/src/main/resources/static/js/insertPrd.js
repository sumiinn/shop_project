/**
 *  insertPrd
 */
 $(document).ready(function(){
 
	/* 중복 체크 */
	 $('#check').on('click',function(){
		event.preventDefault();
		let prdNo = $('#prdNo').val();
		if(prdNo ==""){
			alert("상품번호를 입력하세");
			return false;
		}else{
	 		$.ajax({
	 			type:"post",
	 			url:"/product/prdNoCheck",
	 			data:{"prdNo":prdNo},
	 			dateType:'text', 
	 			success:function(result){
	 				if(result == "available") {
	 					alert("사용 가능한 번호입니다");
	 				} else {
	 					alert("사용할 수 없는 번호입니다.");
	 				}
	 			},
	 			error:function(){
	 				alert("실패");
	 			}
	 		});
		}
 	});
 	
 	/* 메인 분류 선택시 해당 상세 분류 보이기 */
 	$('.mainCategory').each(function(){
		$(this).click(function(){
			$("input:radio[name='subCategory']").prop('checked',false);
			
			let indexN = $(this).index();
			$('.sCategory').addClass('visibility');
			$('.sCategory:eq('+indexN+')').removeClass('visibility');
		});
 	})
 	
/*	$('#insertPrdForm').on('submit',function(){
		event.preventDefault();
		$.ajax({
 			type:"post",
 			url:"/product/insertPrd", 
 			enctype:"multipart/form-data",
 			data : new FormData($('#insertPrdForm')[0]),
 			processData:false,
 			contentType:false,
 			cache:false,
 			success:function(){
 				alert("성공")
 			},
 			error:function() {
 				alert("실패");
 			}
 		});
	});*/
 	
 });