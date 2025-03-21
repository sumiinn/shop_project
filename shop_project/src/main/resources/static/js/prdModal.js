/**
 * 
 */

 $(function() {
 	let mdalP = Number($('#modalPrice')[0].dataset.price);
 	let modalPrdSelect = new Object();
 	let modalNum = document.getElementById('modalnumberCheck');
	$('#modalPrice').text(mdalP.toLocaleString()+'원');
	$('#modalPoint').text((mdalP*0.01).toLocaleString()+' point' +' (1%)');
	
	// 색상 선택 및 구매버튼 활성화
	$('.colorEx').on('click', function(){ 
		$('.colorEx').css("opacity",' 0.5');
		$(this).css("opacity",' 1');
		modalPrdSelect.color = $(this)[0].dataset.color;
		
		if((modalPrdSelect.size!=null && modalPrdSelect.size!="none") && modalPrdSelect.color!= null){
			$('#modalCountNo').removeClass('visibility');
			$('#modalbuttonBar').removeClass('visibility');
			modalNum.value = 1;
			$('#mdalSumCost').text(mdalP.toLocaleString()+'원');
			
		}else{
			$('#modalCountNo').addClass('visibility');
			$('#modalbuttonBar').addClass('visibility');
			modalNum.value = 1;
			$('#mdalSumCost').text(0+'원');
		}
	});
	// 사이즈 선택 및 구매버튼 활성화
	$('#size').on('click', function(){
		modalPrdSelect.size = $('#size').val();
		if(modalPrdSelect.size!="none"&&modalPrdSelect.color!=null){
			$('#modalCountNo').removeClass('visibility');
			$('#modalbuttonBar').removeClass('visibility');
			modalNum.value = 1;
			$('#mdalSumCost').text(mdalP.toLocaleString()+'원');
			
		}else{
			$('#modalCountNo').addClass('visibility');
			$('#modalbuttonBar').addClass('visibility');
			modalNum.value = 1;
			$('#mdalSumCost').text(0+'원');
		}
	})
	
	// 수량 최소 채크 	
	$('#modalnumberCheck').on('change', function(){	
		if(modalNum.value<=0){
			alert("최소 수량은 1개 입니다.");
			modalNum.value=1;
			$('#mdalSumCost').text(mdalP.toLocaleString()+'원');
		}else{
			let amount = mdalP * modalNum.value;
			modalPrdSelect.qty=modalNum.value;
			$('#mdalSumCost').text(amount.toLocaleString()+'원');
		}
	});
	
	$('#modalCartInsertBtn').on('click', function(e){
	    e.preventDefault();

	    let prdNo = $('input[name="prdNo"]').val(); 
	    let cartQty = $('#modalnumberCheck').val();        
	    let cartColor = $('#selectedColor').val();    
	    let cartSize = $('#selectedSize').val();      

	    const cartData = {
	        "prdNo": prdNo,
	        "cartQty": cartQty,
	        "cartColor": cartColor,
	        "cartSize": cartSize
	    };

	    $.ajax({
	        type: "POST",
	        url: "/shop/cart",
	        contentType: "application/json",
	        data: JSON.stringify(cartData),
	        success: function(response){
	            location.href = '/cartList';
	        },
	        error: function(){
	            alert("로그인이 필요합니다.");
	        }
	    });
	});
 	
 });