<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>NOTICE</title>
		<!-- head.jsp import -->
		<c:import url = "/WEB-INF/views/layout/head.jsp"></c:import>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/write.css'/>">
	</head>
	<body>
		<div id="wrap">
			<!-- top.jsp import -->
			<c:import url = "/WEB-INF/views/layout/top.jsp"></c:import>
			<div class="container">
                <div id="containerLeft">
                    <h1>COMMUNITY</h1>
                    <div class="sidebar">
                        <ul>
                            <li><a href="<c:url value='/community/communityView'/>">ABOUT</a></li>
                            <li><a href="<c:url value='/community/noticeView'/>">NOTICE</a></li>
                            <li><a href="#">FAQ</a></li>
                        </ul>
                     </div>
                 </div>
                 <div class="content">
                     <h2>NOTICE</h2>
                     <form method="post" id="insertPostForm" action="<c:url value='/community/insertPost'/>" enctype="multipart/form-data">
                         <input type="hidden" name="commCtgId" value="2"> 
                         <div class="form-group">
                             <label for="title">제목</label>
                             <input type="text" name="postTitle" placeholder="제목 입력" required>
                         </div>
                         <div class="form-group">
                             <label for="writer">글쓴이</label>
                             <input type="text" name="memId" value="${memId}" required readonly>
                         </div>
                         <div class="form-group">
                             <label for="content">내용</label>
                             <textarea name="postDetail" placeholder="내용 입력" required></textarea>
                         </div>
                         <div class="form-group">
                             <label for="imgFile">이미지</label>
                             <input type="file" name="postImgFiles" multiple="multiple">
                         </div>
                         <div class="bt_wrap">
                             <button type="submit" class="save-btn">등록</button>                          
                             <button type="reset" class="cancel-btn" onclick="location.href='<c:url value='/community/postListView'/>'">취소</button>                           
                         </div>
                     </form>
                 </div>
             </div>
			<!-- bottom.jsp import -->
			<c:import url = "/WEB-INF/views/layout/bottom.jsp"></c:import>		
		</div>
	</body>
</html>
