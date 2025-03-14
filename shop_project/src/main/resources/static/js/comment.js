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
		                <button class="commentBtn" id="updateComBtn" onclick="showEditBox(${comment.commentNo})">수정</button>
		                <button class="commentBtn" id="deleteComBtn" onclick="deleteComment(${comment.commentNo})">삭제</button>		              
			        `;
				}
				
				commentHtml += `</div>`;
				
				// 댓글 별 수정 공간 만들기(commentNo 필수)
				commentHtml += `<div id="editCommentBox${comment.commentNo}" style="display:none;">
                                    <textarea id="editContent${comment.commentNo}">${comment.content}</textarea>
                                    <button id="saveEditBtn" onclick="saveEditComment(${comment.commentNo})">수정</button>
                                    <button id="cancelEditBtn" onclick="cancelEditComment(${comment.commentNo})">취소</button>
                                </div>
                `;
			});
			
			// <div> 공간에 추가
			$('#commentList').html(commentHtml);
		},
		error: function(){
			alert("실패");
		}
	});
}

// 댓글 수정 창 열기
function showEditBox(commentNo) {
	$("#editCommentBox" + commentNo).show();
}

// 댓글 수정
function saveEditComment(commentNo) {
	let content = $("#editContent" + commentNo).val();
	
	$.ajax({
		type: "POST",
		url: "/comment/updateComment",
		data: {"commentNo": commentNo,
		       "content": content
		},
	    success: function(response) {
			if(response.status == "success") {				
	    		loadComment();
	    	}else {
	    		alert("댓글 수정에 실패하였습니다.");
	    	}
		},
	    error: function() {
			alert("실패");
		}
	});
}

//댓글 수정 취소
function cancelEditComment(commentNo) {
	$("#editCommentBox" + commentNo).hide();
}

// 댓글 삭제
function deleteComment(commentNo) {
	if(confirm("댓글을 삭제하시겠습니까?")) {
		$.ajax({
			type: "DELETE",
			url: "/comment/deleteComment",
			data: {"commentNo": commentNo},
			success: function(response) {
				if(response.status == "success") {
					loadComment();
				}else {
					alert("댓글 삭제에 실패하였습니다.");
				}
			},
			error: function(){
				alert("실패");
			}
		});
	}
}