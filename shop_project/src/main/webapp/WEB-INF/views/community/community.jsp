<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>커뮤니티</title>
    <!-- head.jsp import -->
	<c:import url = "/WEB-INF/views/layout/head.jsp"></c:import>
	<link rel="stylesheet"   type="text/css"  href="<c:url value='/css/community.css'/>">

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
                    <li><a href="#" onclick="showPage('notice')">공지사항</a></li>
                    <li><a href="#" onclick="showPage('reviewArea')">리뷰</a></li>
                    <li><a href="#" onclick="showPage('qa')">Q &amp;A</a></li>
                </ul>
            </div>
        </div>
        <div class="content">
            <div id="notice" class="page active">
                <h2>공지사항</h2>
                <p>공지사항을 빠르고 정확하게 안내해드립니다.</p>
                <div class="board_list_wrap">
                    <div class="board_list">
                        <div class="top">
                            <div class="num">번호</div>
                            <div class="title">제목</div>
                            <div class="writer">글쓴이</div>
                            <div class="date">작성일</div>
                            <div class="count">조회</div>
                        </div>
                        <c:forEach var="noti" items="${notiList}" varStatus="status">
                            <div>
                                <div class="num">${status.count}</div>
                                <div class="title"><a href="<c:url value='/community/read/${noti.postNo}'/>">${noti.title}</a></div>
                                <div class="writer">${noti.memId}</div>
                                <div class="date"><fmt:formatDate value="${noti.CreatedDate}" pattern="YYYY-MM-dd" /></div>
                                <div class="count">${noti.viewCount}</div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="board_page">
                        <a href="#" class="bt first"><<</a>
                        <a href="#" class="bt prev"><</a>
                        <a href="#" class="num on">1</a>
                        <a href="#" class="num">2</a>
                        <a href="#" class="num">3</a>
                        <a href="#" class="num">4</a>
                        <a href="#" class="num">5</a>
                        <a href="#" class="bt next">></a>
                        <a href="#" class="bt last">>></a>
                    </div>
                    <c:if test="${not empty sessionScope.sid && not empty sessionScope.mid}">
	                    <div class="bt_wrap">
	                        <a href="<c:url value='/community/notification/Write'/>" class="on">등록</a>
	                    </div>
                    </c:if>
                </div>
            </div>
            <div id="reviewArea" class="page" style="display: none;">
                <h2>리뷰관리</h2>
                <p>고객님들의 상품 리뷰를 한눈에 보여드립니다.</p>
                <div class="board_list_wrap">
                    <div class="board_list">
                        <div class="top">
                            <div class="num">번호</div>
                            <div class="title">제목</div>
                            <div class="writer">글쓴이</div>
                            <div class="date">작성일</div>
                            <div class="count">조회</div>
                        </div>
                        <c:forEach var="post" items="${posts}">
                            <div>
                                <div class="num">${post.id}</div>
                                <div class="title">${post.title}</div>
                                <div class="writer">${post.writer}</div>
                                <div class="date">${post.date}</div>
                                <div class="count">${post.viewCount}</div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="board_page">
                        <a href="#" class="bt first"><<</a>
                        <a href="#" class="bt prev"><</a>
                        <a href="#" class="num on">1</a>
                        <a href="#" class="num">2</a>
                        <a href="#" class="num">3</a>
                        <a href="#" class="num">4</a>
                        <a href="#" class="num">5</a>
                        <a href="#" class="bt next">></a>
                        <a href="#" class="bt last">>></a>
                    </div>
                    <c:if test="${not empty sessionScope.sid}">
	                    <div class="bt_wrap">	
	                        <a href="<c:url value='/community/review/Write'/>" class="on">등록</a>
	                    </div>
                    </c:if>
                </div>
            </div>
            <div id="qa" class="page" style="display: none;">
                <h2>Q&A</h2>
                <p>고객님들의 질문과 답변을 한눈에 보여드립니다.</p>
                <div class="board_list_wrap">
                    <div class="board_list">
                        <div class="top">
                            <div class="num">번호</div>
                            <div class="title">제목</div>
                            <div class="writer">글쓴이</div>
                            <div class="date">작성일</div>
                            <div class="count">조회</div>
                        </div>
                        <c:forEach var="post" items="${posts}">
                            <div>
                                <div class="num">${post.id}</div>
                                <div class="title">${post.title}</div>
                                <div class="writer">${post.writer}</div>
                                <div class="date">${post.date}</div>
                                <div class="count">${post.viewCount}</div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="board_page">
                        <a href="#" class="bt first"><<</a>
                        <a href="#" class="bt prev"><</a>
                        <a href="#" class="num on">1</a>
                        <a href="#" class="num">2</a>
                        <a href="#" class="num">3</a>
                        <a href="#" class="num">4</a>
                        <a href="#" class="num">5</a>
                        <a href="#" class="bt next">></a>
                        <a href="#" class="bt last">>></a>
                    </div>
                    <c:if test="${not empty sessionScope.sid}">
	                    <div class="bt_wrap">
	                        <a href="<c:url value='/community/qa/Write'/>" class="on">등록</a>
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
<script>
    function showPage(page) {
        $('.page').hide();
        $('#' + page).show();
    }
</script>
</html>
