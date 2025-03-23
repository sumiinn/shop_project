/**
 * admin.js
 */

$(document).ready(function(){
	// 상품 번호 중복 체크
	$('#check').on('click',function(e){
		e.preventDefault();
		
		let prdNo = $('#prdNo').val();
		if(prdNo ==""){
			alert("상품번호를 입력하세요");
			return false;
		}else{
	 		$.ajax({
	 			type:"GET",
	 			url:"/admin/product/check",
	 			contentType: "application/json",
	 			data:{"prdNo":prdNo},
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
	
	// 메인 분류 선택시 해당 상세 분류 보이기
	$('.mainCategory').each(function(index) {
        $(this).click(function() {
            $("input:radio[name='subCategory']").prop('checked', false);
            let indexN = $(this).index();
            $('.sCategory').addClass('visibility');            
            //$('.sCategory:eq(' + indexN + ')').removeClass('visibility');    
            $('.sCategory').eq(index).removeClass('visibility');
        });
    });
	
	// 상품 등록 
    $('#insertPrdForm').on('submit', function(e) {
        e.preventDefault();

        let formData = new FormData(this);

        $.ajax({
            type: "POST",
            url: "/admin/product",
            data: formData,
            processData: false,
            contentType: false,
            success: function() {
            	location.href = '/';
            },
            error: function() {
                alert("상품 등록 실패");
            }
        });
    });
    
    // 상품 정보 불러오기
    $('#load').on('click', function (e) {
        e.preventDefault();

        let prdNo = $('#prdNo').val();
        
        if (prdNo === "") {
            alert("상품번호를 입력하세요");
            return;
        }

        $.ajax({
            type: "GET",
            url: `/admin/product/${prdNo}`,  
            success: function (prdVO) {
                if (!prdVO) {
                    alert("상품 정보를 찾을 수 없습니다.");
                    return;
                }

                $('#prdName').val(prdVO.prdName);
                $('#prdPrice').val(prdVO.prdPrice);
                $('#prdSale').val(prdVO.prdSale);

                // 사이즈 체크박스 체크
                const sizes = prdVO.prdSize ? prdVO.prdSize.split(",") : [];
                $('.scheckbox').each(function () {
                    $(this).prop('checked', sizes.includes($(this).val()));
                });

                // 메인 카테고리 선택
                $('.mainCategory').each(function () {
                    $(this).prop('checked', $(this).val() == prdVO.mcId);
                });

                // 서브 카테고리 선택
                $('.subCategory').each(function () {
                    $(this).prop('checked', $(this).val() == prdVO.scId);
                });
            },
            error: function () {
                alert("상품 불러오기 실패");
            }
        });
    });
    
    // 상품 수정
    $('#updatePrdForm').on('submit', function (e) {
        e.preventDefault();

        const prdNo = $('#prdNo').val();
        
        if (!prdNo) {
            alert("상품번호가 없습니다.");
            return;
        }

        // 사이즈 여러개니까 배열로 모아서 문자열로 만들기
        const sizes = $('.scheckbox:checked').map(function () {
            return $(this).val();
        }).get().join(",");

        const productData = {
            prdName: $('#prdName').val(),
            prdPrice: $('#prdPrice').val(),
            prdSale: $('#prdSale').val(),
            mcId: $('input[name="mcId"]:checked').val(),
            scId: $('input[name="scId"]:checked').val(),
            prdSize: sizes
        };

        $.ajax({
            type: "PUT",
            url: `/admin/product/${prdNo}`,
            contentType: "application/json",
            data: JSON.stringify(productData),
            success: function () {
                location.href = '/';  
            },
            error: function () {
                alert("상품 수정 실패");
            }
        });
    });
    
    // 상품 삭제
    $('#deleteBtn').click(function() {
        if (confirm("상품을 삭제 하시겠습니까?")) {
            let prdNo = $(this).data('prdno');
            $.ajax({
                type: "DELETE",
                url: "/admin/product/" + prdNo,
                success: function(mcId) {
                    location.href = "/product/productCtgList/" + mcId;
                },
                error: function() {
                    alert("삭제 실패");
                }
            });
        }
    });

});
 
	
 	
 	
