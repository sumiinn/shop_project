<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>REVIEW</title>
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
                    <h3>REVIEW</h3>
                    <div id="prdInfo">                                                   
                        <img src="<c:url value='/project_images/product/${review.mcId}/${review.prdInfoImg}'/>"
                             onclick="location.href='/product/productDetailView/${review.prdNo}'">                                                                           
                        <div id="prdTitle">
                            <a href="/product/productDetailView/${review.prdNo}">
                                ${review.prdName}
                            </a>
                            <fmt:formatNumber value="${review.prdPrice}" pattern="#,###" /> 원<br>
                            <button onclick="location.href='/product/productDetailView/${review.prdNo}'">상품 상세보기</button>
                        </div>                       
                    </div>
                   
                    <h4>${review.postTitle}</h4>
                    <p>${review.memId}</p>
                    <div id="postDetail">
                        <c:if test="${not empty review.postImg}">
                            <c:forEach var="img" items="${fn:split(review.postImg, ',')}">
                                <img src="<c:url value='/project_images/upload/${img}'/>">  
                            </c:forEach>
                        </c:if>${review.postDetail}
                    </div>
                    <div id="postButton">
                        <button id="postListBtn" onclick="location.href='<c:url value='/community/reviewView'/>'">목록</button> 
                        <c:if test="${sessionScope.sid eq review.memId}">
                            <button id="postUpdateBtn" onclick="location.href='<c:url value='/community/updatePostForm/${postNo}'/>'">수정</button>
                            <button id="postDeleteBtn" onclick="location.href='<c:url value='/community/deletePost/${postNo}'/>'">삭제</button>
                        </c:if>    
                    </div>   
                    
                    <!-- 댓글 -->           
                    <c:choose>
                        <c:when test="${not empty sessionScope.sid}">
                            <form id="commentForm">
                                <input type="hidden" name="memId" value="${sessionScope.sid}">
                                <input type="hidden" name="postNo" value="${review.postNo}">
                                <textarea id="commentContent" name="content" placeholder="댓글을 입력해주세요." required></textarea>
                                <button id="contentBtn">등록</button>
                            </form>
                        </c:when>
                        <c:otherwise>
                            <div>회원에게만 댓글 작성 권한이 있습니다.</div>
                        </c:otherwise>
                    </c:choose>	 
                    
                    <!-- 댓글 출력 공간 -->
                    <div id="commentList">                   
                    </div>              
                </div>
            </div>
			<!-- bottom.jsp import -->
			<c:import url = "/WEB-INF/views/layout/bottom.jsp"></c:import>		
		</div>
	</body>
</html>
