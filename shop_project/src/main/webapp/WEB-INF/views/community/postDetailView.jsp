<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>${post.postTitle} NOTICE</title>
		<!-- head.jsp import -->
		<c:import url = "/WEB-INF/views/layout/head.jsp"></c:import>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/comm_detail.css'/>">
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
                            <li><a href="<c:url value='/community/reviewView'/>">REVIEW</a></li>
                        </ul>
                    </div>
                </div>
                <div class = "content">
                    <h4>${post.postTitle}</h4>
                    <p>${post.memId}</p>
                    <div id="postDetail">
                        <c:if test="${not empty post.postImg}">
                            <c:forEach var="img" items="${fn:split(post.postImg, ',')}">
                                <img src="<c:url value='/project_images/upload/${img}'/>">  
                            </c:forEach>
                        </c:if>${post.postDetail}
                    </div>
                    <div id="postButton">
                        <button id="postListBtn" onclick="location.href='<c:url value='/community/noticeView'/>'">목록</button> 
                        <c:if test="${not empty sessionScope.sid && not empty sessionScope.mid}">
                            <button id="postUpdateBtn" onclick="location.href='<c:url value='/community/updatePostForm/${postNo}'/>'">수정</button>
                            <button id="postDeleteBtn" onclick="location.href='<c:url value='/community/deletePost/${postNo}'/>'">삭제</button>
                        </c:if>    
                    </div>               	               
                </div>
             </div>
			<!-- bottom.jsp import -->
			<c:import url = "/WEB-INF/views/layout/bottom.jsp"></c:import>		
		</div>
	</body>
</html>
