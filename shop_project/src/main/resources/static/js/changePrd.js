/**
 *  changePrd JS
 */
 $(function() { 
 	$('#load').on('click', function(){
 		event.preventDefault();
 		let prdNo = $('#prdNo').val();
 		if( prdNo == ""){
 			alert("상품번호를 입력하세요");
 		}else{
 			$.ajax({
	 			type:"post",
	 			url:"/product/prdDataLoad",
	 			data:{"prdNo":prdNo},
	 			dateType:'text', 
	 			success:function(prdVO){
	 				if(prdVO == "") {
	 					alert("올바른 상품 번호가 아닙니다.");
	 				} else {
	 					let prdSizeList="";
	 					if(prdVO.prdSize!=null){
		 					prdSizeList = prdVO.prdSize.split(",");
	 					}
	 					
	 					$('#prdName').val(prdVO.prdName);
	 					$('#prdPrice').val(prdVO.prdPrice);
	 					$('.scheckbox').each(function(){
	 						if(prdSizeList.indexOf($(this).val())!=-1){
	 						 $(this)[0].checked=true;
	 						}
	 						
	 					})
	 					$('#prdSale').val(prdVO.prdSale);
	 					$('.mainCategory').each(function(){
	 						if($(this)[0].value ==prdVO.mcId){
	 						 $(this)[0].checked=true;
	 						}
	 					})
	 					$('.subCategory').each(function(){
	 						if($(this)[0].value ==prdVO.scId){
	 						 $(this)[0].checked=true;
	 						}
	 					})
	 					$('.mainCategory').each(function(){
							if($(this)[0].checked == true){
								$("input:radio[name='subCategory']").prop('checked',false);
								
								let indexN = $(this).index();
								$('.sCategory').addClass('visibility');
								$('.sCategory:eq('+indexN+')').removeClass('visibility');									
							}
								
					 	})
	 					
	 				}
	 			},
	 			error:function(){
	 				alert("실패");
	 			}
	 		});
 		}
 	});
 });