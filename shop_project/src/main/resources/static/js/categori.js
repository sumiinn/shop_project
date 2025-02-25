/**	
 *  카테고리 js
 */
$(function(){
	
	/*라인 하나에 상품 나오는 수 변경*/
	
	$('#countN').text($('.prdBox').length);
	$('#tv').on('click',function(){
		$('.prdBox').removeClass('fourCountG');
		$('.prdBox').removeClass('eightCountG');
		$('.prdBox').removeClass('sixCountG');
		$('.prdBox').addClass('twoCountG');
		$('.apBprdImg').addClass('twoModeImg');		
		$('.apBprdText').addClass('twoModeText');		
	});
	$('#fv').on('click',function(){
		$('.prdBox').removeClass('twoCountG');
		$('.prdBox').removeClass('eightCountG');
		$('.prdBox').removeClass('sixCountG');
		$('.apBprdImg').removeClass('twoModeImg');
		$('.apBprdText').removeClass('twoModeText');
		$('.prdBox').addClass('fourCountG');
	});
	$('#sv').on('click',function(){
		$('.prdBox').removeClass('twoCountG');
		$('.prdBox').removeClass('eightCountG');
		$('.prdBox').removeClass('fourCountG');
		$('.apBprdImg').removeClass('twoModeImg');
		$('.apBprdText').removeClass('twoModeText');
		$('.prdBox').addClass('sixCountG');
	});
	$('#ev').on('click',function(){
		$('.prdBox').removeClass('twoCountG');
		$('.prdBox').removeClass('fourCountG');
		$('.prdBox').removeClass('sixCountG');
		$('.apBprdImg').removeClass('twoModeImg');
		$('.apBprdText').removeClass('twoModeText');
		$('.prdBox').addClass('eightCountG');
	});
	
	/*카테고리 세부 분류*/
	let categoriIdArr=[];
	let categoriClassArr=[];
	$('.categoriBox').each(function(){
		categoriIdArr.push($(this).attr("data-ctgName"));
		categoriClassArr.push($(this).attr("data-ctgName"));
	});
	categoriIdArr.shift();
	categoriClassArr.shift();
	
	$('#totalCategori').on('click',function(){
		$('.prdBox').removeClass('visibility');
		$('.categoriBox').removeClass('selectBox');
		$('#slideBox').removeClass('visibility');
		$('#totalCategori').addClass('selectBox');
		$('#countN').text($('.prdBox').length);
	});

	for(let i = 0; i<categoriIdArr.length; i++){
		let tempId='#'+categoriIdArr[i];
		$(tempId).on('click',function(){
			let subIdNo=$(this)[0].dataset.subno;
			let countPub=0;
			$('.categoriBox').removeClass('selectBox');
			$(tempId).addClass('selectBox');
			
	
			$('.prdBox').each(function(index,item){
				if($(this)[0].dataset.sub==subIdNo){
					$(this).removeClass('visibility');
					++countPub;
				}else{
					$(this).addClass('visibility');
				}
			});
			$('#countN').text(countPub);
			$('#slideBox').addClass('visibility');
		})
	}
	
	// 베스트 상품 가격 불러오기
	$('.bestPrice').each(function(){
		let prdprice = Number($(this)[0].dataset.price);
		$(this).text(prdprice.toLocaleString()+'원');	
	});
	
	// 상품 가격 불러오기
	$('.apBPrdPrice').each(function(){
		let prdprice = Number($(this)[0].dataset.price);
		$(this).text(prdprice.toLocaleString()+'원');	
	});
	
	//  상품 에 마우스 올리면 그림자
	
	$('.prdBox').hover(function(){
		$(this).css('box-shadow', '5px 5px 3px #666'); 
	},function(){
		$(this).css('box-shadow', ''); 
	});
	/*
	// 클릭시 이동
	$('.prdBox').on('click',function(){
		$(location).attr("href", "http://localhost:8080/NonMajor5/detailedProduct.html")
	})
	
	$('.slideImage').on('click',function(){
		$(location).attr("href", "http://localhost:8080/NonMajor5/detailedProduct.html")
	})
	*/
	// 슬라이드쇼 
	let ul = document.querySelector('#slideWrap');
	let li = document.querySelector('.slideItem');
	let liWidth=li.clientWidth;

 
    var curIndex = 0;
 	function move(){
        ul.style.transition = '0.5s';
        ul.style.transform = "translate3d(-"+liWidth*(curIndex+1)+"px, 0px, 0px)";
 
        curIndex++;
 
        if(curIndex === 3){
            setTimeout(function(){
                ul.style.transition = '0s';
                ul.style.transform = "translate3d(0px, 0px, 0px)";
            },201)
            curIndex = 0;
        }
    }
     let moveSlide= setInterval(move,3000);

	$('.bestImg').hover(function(){
		$(this).css('opacity','0.5');
	},function(){
		$(this).css('opacity','1');
	})
	
	$('#slideWrap').hover(function(){
		clearInterval(moveSlide);
	},function(){
		moveSlide= setInterval(move,3000);
	})
 
 	$('.prdContent').on('click',function(){
 		let prdno=$(this)[0].dataset.prdno;
		location.href="/product/productDetailView/"+prdno+""; 	
 	});

});
