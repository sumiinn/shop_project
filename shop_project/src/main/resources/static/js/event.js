/**
 * event.js
 */

$(function(){
    // 초기 페이지 : ALL
    let currentPath = location.pathname;

    if (currentPath === '/event') {
        $(".btn[data-discount='all']").addClass('selectedItem');
    } else if (currentPath.includes('/event/eventCtgList/1')) {
        $(".btn[data-discount='1']").addClass('selectedItem');
    } else if (currentPath.includes('/event/eventCtgList/2')) {
        $(".btn[data-discount='2']").addClass('selectedItem');
    } else if (currentPath.includes('/event/eventCtgList/3')) {
        $(".btn[data-discount='3']").addClass('selectedItem');
    }
    
    // 버튼 클릭 시 이벤트 처리
    $('.btn').on('click', function() {
        let discountType = $(this).attr('data-discount');

        // btn 클래스 제거
        $('.btn').removeClass('selectedItem');
        // 추가
        $(this).addClass('selectedItem'); 
        
        // URL 변경
        if (discountType === 'all') {
            location.href = '/event';
        } else {
            location.href = '/event/eventCtgList/' + discountType;
        }
   
        
    });
    
    $('.prdItem').on('click',function(){
		$(location).attr("href", "http://localhost:8080/NonMajor5/detailedProduct.html")
	});
});