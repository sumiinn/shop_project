/**
 *  상세 상품 자바 스크립트
 */

$(function() { 
	let infoBig = document.getElementById("infoBig");	
	let num = document.getElementById('numberCheck');
	let prdPrice =Number($('#clothesCost')[0].dataset.price);
	let prdSelet = new Object();
	
	let prdNo=$('#prdInfoArea')[0].dataset.prdno;
	$('#clothesCost').text(prdPrice.toLocaleString()+'원');  
	$('#point').text((prdPrice*0.01).toLocaleString()+' point'+" (1%)"); //포인트 계산
	
	 // 클릭시 이미지 변경
	$('.infoSmall img').hover(function() { 
		infoBig.src=this.src;		
	});
	
	// 색상 선택 및 구매버튼 활성화
	$('.colorEx').on('click', function(){ 
		$('.colorEx').css("opacity",' 0.5');
		$(this).css("opacity",' 1');
		prdSelet.color = $(this)[0].dataset.color;
		
		if((prdSelet.size!=null && prdSelet.size!="none") && prdSelet.color!= null){
			$('#countNo').removeClass('visibility');
			$('#buttonBar').removeClass('visibility');
			num.value = 1;
			$('#sumCost').text(prdPrice.toLocaleString()+'원');
			prdSelet.qty=num.value;
			
		}else{
			$('#countNo').addClass('visibility');
			$('#buttonBar').addClass('visibility');
			num.value = 1;
			$('#sumCost').text(0+'원');
		}
	});
	// 사이즈 선택 및 구매버튼 활성화
	$('#size').on('click', function(){
		prdSelet.size = $('#size').val();
		if(prdSelet.size!="none"&&prdSelet.color!=null){
			$('#countNo').removeClass('visibility');
			$('#buttonBar').removeClass('visibility');
			num.value = 1;
			$('#sumCost').text(prdPrice.toLocaleString()+'원');
			prdSelet.qty=num.value;
			
		}else{
			$('#countNo').addClass('visibility');
			$('#buttonBar').addClass('visibility');
			num.value = 1;
			$('#sumCost').text(0+'원');
		}
	})
	
	// 수량 최소 채크 	
	$('#numberCheck').on('change', function(){	
		if(num.value<=0){
			alert("최소 수량은 1개 입니다.");
			num.value=1;
			$('#sumCost').text(prdPrice.toLocaleString()+'원');
		}else{
			let amount = prdPrice *num.value;
			prdSelet.qty=num.value;
			$('#sumCost').text(amount.toLocaleString()+'원');
		}
	});
	// 리뷰 제목 클릭시 숨겨진 리뷰 활성화
	$('.reviewTableTr').each(function (index,item){
		$(this).on('click',function(){
			if($('.reviewContent').eq(index).hasClass('visibility')===true){
				$('.reviewContent').addClass('visibility');
				$('.reviewContent').eq(index).removeClass('visibility');		
			}else{
				$('.reviewContent').addClass('visibility')
			}
		})
	});
	
	// 리뷰 별표시
	$('.reviewScore').each(function (){

		let score = Number($(this)[0].dataset.score);
		let a = score/2;
		let b = score%2;
		let scoreStar = "";
		
		for(let i = 0; i<a ; i++){
			scoreStar+="★";
		}
		if(b != 0){
			scoreStar+="☆";
		}
		$(this).text(scoreStar);
	});
	$('#rollUp').on('click', function() {
    	$('html, body').animate({scrollTop: '0'}, 680);
  	});
	
	// 모달창 띄우고 특정 영역 선택시 모달 끄기
	$('.suggestion').on('click',function(){
	event.preventDefault();
		$('#prdModal').addClass('on');
		$('body').css('overflow','hidden');
		
		let prdno = $(this)[0].dataset.prdno;
	
		$.ajax({
	 			type:"post",
	 			url:"/product/modalPrd",
	 			data:{"prdno":prdno},
	 			dateType:'text', 
	 			success:function(result){
	 				$('#prdModal').html(result);
	 			},
	 			error:function(){
	 				alert("실패");
	 			}
	 		});		

	});
	$('html').click(function(e) {  
		if($(e.target).hasClass('modal')){
			$('.modal').removeClass('on');
			$('body').css('overflow','auto');
		}
	});
	
	/* 상품 삭제 버튼 */
	$('#deleteBtn').click(function(){
		let deletcheck = confirm("상품을 삭제 하시겠습니까?");
		
		if(deletcheck){
		
			let prdNo = $(this)[0].dataset.prdno;
			let mcId = $(this)[0].dataset.mcid;
			location.href = "/product/deleteProduct/"+prdNo
		}	
	})
	
	/* 색상, 사이즈 받아와서 장바구니에 전달  */
	document.querySelectorAll('.colorEx').forEach(function(element) {
        element.addEventListener('click', function() {
            let color = this.getAttribute('data-color').replace('.jpg', '');
            document.getElementById('selectedColor').value = color;
        });
    });

    document.getElementById('size').addEventListener('change', function() {
        document.getElementById('selectedSize').value = this.value;
    });     
   
	/* 장바구니에 상품 추가 */
	/*
	let memId;
    $.ajax({
        type: "get",
        url: "/getMemId",
        success: function(response) {
            memId = response;
        }
    });*/
    /*
	$('#shoppingCart').on('click', function(){
		event.preventDefault();
		$.ajax({
	 			type:"post",
	 			url:"/shop/insertCart",
	 			data:{"memId":memId,
	 			      "prdNo":prdNo,	 			      
	 				  "cartQty":prdSelet.qty,
	 				  "cartColor":prdSelet.color,
	 				  "cartSize":prdSelet.size},
	 			dataType:'text', 
	 			success:function(result){
	 				alert("상품을 장바구니에 담았습니다.");
	 				location.href = "/cartList";
	 			},
	 			error:function(){
	 				alert("실패");
	 			}
	 		});		
	})*/
	//let modalP = $('#modalPrice').dataset.price;
	
					
	/*
	// 추천상품 마우스 올리면 사진 확대
	$('.suggestionImage').hover(function(){ //
		$(this).css('transform', 'scale(1.1)'); 
		$('.suggestion div').css('overflow', 'hidden'); 
	},function(){
		$(this).css('transform', 'scale(1)');
	});

	// 추천 상품td 에 마우스 올리면 그림자
	$('.suggestion').hover(function(){
		$(this).css('box-shadow', '5px 5px 3px #666'); 
	},function(){
		$(this).css('box-shadow', ''); 
	});
	
	
	
	
	
	
	// 상품 구매 값 넘기기
	$('#purchase').on('click',function(){
		$(location).attr("href", "http://localhost:8080/NonMajor5/cart.html")
		localStorage.setItem("prd-info", JSON.stringify(purchaseInfo));
	}); */
 }); 
	
	
	