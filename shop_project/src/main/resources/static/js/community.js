/**
 * community.js
 */

$(document).ready(function(){
	// 게시글 등록
	$('#insertPostForm').on('submit', function(e){
		e.preventDefault();
		
		let formData = new FormData(this);
		
		$.ajax({
			type: "POST",
			url: "/community/insertPost",
			data: formData,
			processData: false, // 파일 깨짐 방지
			contentType: false, // 자동 처리
			success: function(response){
				//console.log(response);
				location.href = '/community/noticeView';
			},
			error: function(xhr){
				console.log(xhr.responseText);
			}
		});
	});
	
	// 게시글 수정
	$('#updatePostForm').on('submit', function(e){
		e.preventDefault();
		
		let formData = new FormData(this);
		
		$.ajax({
			type: "POST",
			url: "/community/updatePost",
			data: formData,
			processData: false,
			contentType: false,
			success: function(response){
				location.href = '/community/noticeView';
			},
			error: function(xhr){
				console.log(xhr.responseText);
			}
		});
	});
	
	// 게시글 삭제
	$('#postDeleteBtn').on('click', function(){
		
		if(confirm("게시글을 삭제하시겠습니까?")) {
			const postNo = $(this).data('postno');
			
			$.ajax({
				type: "DELETE",
				url: "/community/deletePost/" + postNo,
				success: function(response){
					location.href = '/community/noticeView';
				},
				error: function(xhr){
					console.log(xhr.responseText);
				}
			});
		}
		
	});
});