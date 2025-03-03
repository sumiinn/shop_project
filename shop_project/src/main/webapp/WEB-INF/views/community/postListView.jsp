<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>NOTICE</title>
		<!-- head.jsp import -->
		<c:import url = "/WEB-INF/views/layout/head.jsp"></c:import>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/community.css'/>">
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
                        <div id="notice" class="page active">
                            <h2>NOTICE</h2>
                            <div class="board_list_wrap">
                                <div class="board_list">
                                    <div class="top">
                                        <div class="num">번호</div>
                                        <div class="title">제목</div>
                                        <div class="writer">글쓴이</div>
                                        <div class="date">작성일</div>
                                        <div class="count">조회</div>
                                    </div>
                                    <c:forEach var="notice" items="${noticeList}" varStatus="status">
                                        <div>
                                           <div class="num">${status.count}</div>
                                           <div class="title"><a href="<c:url value='/community/detailViewPost/${notice.postNo}'/>">${notice.postTitle}</a></div>
                                           <div class="writer">${notice.memId}</div>
                                           <div class="date"><fmt:formatDate value="${notice.createdDate}" pattern="YYYY-MM-dd" /></div>
                                           <div class="count">${notice.viewCount}</div>
                                        </div>
                                    </c:forEach>
                                </div>
                    
                                <c:if test="${not empty sessionScope.sid && not empty sessionScope.mid}">
	                                <div class="bt_wrap">
	                                    <a href="<c:url value='/community/noticePostView'/>" class="on">등록</a>
	                                </div>
                                </c:if>
                           </div>
                       </div>
                   </div>
               </div>
			<!-- bottom.jsp import -->
			<c:import url = "/WEB-INF/views/layout/bottom.jsp"></c:import>		
		</div>
	</body>
</html>
