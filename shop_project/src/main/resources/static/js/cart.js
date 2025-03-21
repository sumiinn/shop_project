/**
 * cart.js
 */


$(function(){	
	// 초기 페이지 : domesticBtn 선택
    $('#domesticBtn').addClass('selectedItem'); 	
    
    // 버튼 클릭 시 이벤트 처리
    $('.btn').on('click', function(){   
		$('.btn').css({
			'color': 'gray',
			'border-style': 'solid',
			'border-width': '1px',
			'border-color': '#ddd #ddd white #ddd'
		});
		
		$(this).css({
			'color': 'black',
			'border-style': 'solid',
			'border-width': '1px',
			'border-color': 'black black white black'
		});
		            
	});
      
    // 페이지 초기 설정
    $('#domesticBtn').click();     
    
    // 주문수량 변경 처리
	let amount = $('.amount');
	let price = $('.price');
	let points = $('.points');
	let sum = 0;
	
	// 장바구니 수량 업데이트 (버튼 클릭 시 수행)
    $('.update').on('click', function() {
    	let updateList = [];
    
       // 주문수량 수정 시
       $.each($('.quantity'), function(i) {        
          let qty = $(this).val();
            
          // 상품 구매 금액 업데이트
          price[i].dataset.amount = (price[i].dataset.price * qty); // 가격 value 업데이트
          price[i].innerHTML = (price[i].dataset.price * qty).toLocaleString() + ' 원'; // 표시 (천단위)
            
          // 총 상품 금액 업데이트
          amount[i].dataset.amount = (price[i].dataset.price * qty); // 가격 value 업데이트
          amount[i].innerHTML = (price[i].dataset.price * qty).toLocaleString(); // 표시 (천단위)
            
          // 적립금 업데이트
          points[i].dataset.points = (price[i].dataset.price * qty * 0.01); // 포인트 value 업데이트
          points[i].innerHTML = (price[i].dataset.price * qty * 0.01).toLocaleString() + ' 원';                  
            
          sumAmount(); // 총 금액 계산
            
          let totalAmount = sum + 2500;
            
          // 총 구매 예정 금액 출력
          $('.totalPrice').text(sum.toLocaleString() + '원');
          $('.totalAmount').text('= ' + totalAmount.toLocaleString() + '원');                     
       
       });
       
       // 수량 저장할 배열 선언
       let cartNos = [];
       let cartQtys = [];

       // cartNo, cartQty를 배열에 추가
       $('.quantity').each(function() {
           let cartNo = $(this).siblings('input[name="cartNo"]').val(); // name="cartNo"인 hidden input 가져오기
           let cartQty = $(this).val();
           
           updateList.push({
        	   "cartNo": cartNo,
               "cartQty": cartQty
           });          
       });

       // 서버로 전송
       $.ajax({
           type: "PUT",
           url: "/shop/cart",
           contentType: "application/json",
           data: JSON.stringify(updateList),
           success: function(response) {
        	   location.href = "/cartList";
           },
           error: function() {
               alert('실패');
           }
       });
    });	

    // sum 계산하는 함수
    function sumAmount() {
        sum = 0;
        $('.amount').each(function() {
            sum += Number($(this).attr("data-amount"));
        });
    }       
   
    // 삭제 버튼 클릭 시
    $('.delete').on('click', function(){
       // 체크 여부 확인 : 하나라도 체크하면 true, 아무 것도 체크하지 않으면 false
	   let checked = $('.itemCheckbox').is(':checked');
       if(checked){
         if(confirm('상품을 장바구니에서 삭제하시겠습니까?')){        	 
		    // 체크된 체크박스의 cartNo를 배열에 추가
	 	    let checkArr = [];
	 	    
	 		$('.itemCheckbox:checked').each(function() {
	 			checkArr.push($(this).val()); 
	 		});	
 				
 			// 서버로 전송
 			$.ajax({
 				type:"DELETE",
				url:"/shop/cart", 
				contentType: "application/json",
			 	data : JSON.stringify(checkArr), 
			 	success:function(response) {
 					location.href= "/cartList";
			 	},
			 	error:function() {
			 		alert("실패");
			 	} 	 					
	 		}); // ajax 종료
	     }else{
		    alert('삭제를 취소합니다.');
	     }
       }else{
         alert("선택된 상품이 없습니다");
       }	   
    });           
   
});