<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>커뮤니티 글 작성</title>
	 <!-- head.jsp import -->
	<c:import url = "/WEB-INF/views/layout/head.jsp"></c:import>
    <link rel="stylesheet"   type="text/css"  href="<c:url value='/css/write.css'/>">
    <script src="<c:url value='/js/write.js'/>"></script>
</head>
<body>
   <div id="wrap">
		<!-- top.jsp import -->
		<c:import url = "/WEB-INF/views/layout/top.jsp"></c:import>
    <div class="container">
        <div id="containerLeft">
            <h1>커뮤니티</h1>
            <div class="sidebar">
                <ul>
                    <li><a href="<c:url value='/community/communityView'/>" onclick="showPage('notice')">공지사항</a></li>
                    <li><a href="<c:url value='/community/communityView'/>" onclick="showPage('review')">리뷰관리</a></li>
                    <li><a href="<c:url value='/community/communityView'/>" onclick="showPage('qa')">Q&A</a></li>
                </ul>
            </div>
        </div>
        <div class="content">
            <h2>Q&A</h2>
            <p>질문을 작성해주세요.</p>
            <form id="writeForm" action="/community/insert" enctype="multipart/form-data">
                <input type="hidden" name="comuCateId" value="3">
                <div class="form-group">
                    <label for="title">제목</label>
                    <input type="text" id="title" name="title" placeholder="제목 입력">
                </div>
                <div class="form-group">
                    <label for="writer">글쓴이</label>
                    <input type="text" id="writer" name="memId" value="${memId }" required readonly>
                </div>
                <div class="form-group">
                    <label for="content">내용</label>
                    <textarea id="content" name="detail" placeholder="내용 입력"></textarea>
                </div>
                <div class="form-group">
                    <label for="imgFile">이미지 업로드</label>
                    <input type="file" id="imgFile" name="img" multiple="multiple">
                </div>
                <div class="bt_wrap">
                    <button type="submit" class="save-btn">등록</button>
                    <button type="button" class="cancel-btn" onclick="history.back()">취소</button>
                </div>
            </form>
        </div>
    </div>
    <!-- bottom.jsp import -->
    	<c:import url = "/WEB-INF/views/layout/bottom.jsp"></c:import>		
	</div>
</body>
</html>
