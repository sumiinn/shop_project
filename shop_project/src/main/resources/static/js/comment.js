/**
 * comment.js
 */

$(document).ready(function(){
	loadComment();
});

// 댓글 작성
function insertComment() {
	// textarea에 입력된 content 가져오기(댓글)
	let content = $('#commentContent').val().trim();
	
	if(content === "") {
		alert("댓글을 입력해주세요.");
		return;
	}
	
	let formData = $('#commentForm').serialize();
	
	$.ajax({
		type: "POST",
		url: "/comment/insertComment",
		data: formData,
		success: function(response) {
			if(response.status === "success") {
				// 폼 초기화
				$('#commentForm').val('');
				// 댓글 불러오기
				loadComment();
			} else {
				alert("댓글 작성에 실패하였습니다.");
			}
		},
		error: function(){
			alert("실패");
		}
	});
}

// 댓글 불러오기
function loadComment() {
	let postNo = $('input[name="postNo"]').val();
	let userId = $('input[name="sid"]').val();
	
	$.ajax({
		type: "GET",
		url: "/comment/loadComment/" + postNo,
		dataType: "json",
		success: function(comments){
			let commentHtml = "";
			
			if(comments.length === 0) {
				$('#commentList').html("<p>등록된 댓글이 없습니다.</p>");
				return;
			}
			
			$.each(comments, function(index, comment){				
				commentHtml += `
					<div id="commentListBox">
	                    <p id="comInfo">${comment.memId} &nbsp;&nbsp;&nbsp;&nbsp; ${comment.createdDate}</p>
	                    <p id="comInfo">${comment.content}</p>                  	             
	            `;
				
				if(userId === comment.memId) {
					commentHtml += `								           
		                <button class="commentBtn" id="updateComBtn">수정</button>
		                <button class="commentBtn" id="deleteComBtn">삭제</button>		              
			        `;
				}
				
				commentHtml += `</div>`;
			});
			// <div> 공간에 추가
			$('#commentList').html(commentHtml);
		},
		error: function(){
			alert("실패");
		}
	});
}