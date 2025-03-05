<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>REVIEW</title>
		<!-- head.jsp import -->
		<c:import url = "/WEB-INF/views/layout/head.jsp"></c:import>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/review.css'/>">
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
                <div class="content">  
                    <h2>REVIEW</h2>                                            
                    <table id="reviewTable">
                        <tr>
                            <th>NO</th>
                            <th>PRODUCT</th>
                            <th>SUBJECT</th>
                            <th>WRITER</th>
                            <th>DATE</th>
                        </tr>
                        
                        <c:forEach var="review" items="${reviewList}" varStatus="status">
                            <tr>
                                <td class="num_td">${reviewList.size() - status.index}</td>
                                <td class="img_td">
                                    <a href="/product/productDetailView/${review.prdNo}">
                                        <img src="<c:url value='/project_images/product/${review.mcId}/${review.prdInfoImg}'/>">
                                    </a>                               
                                </td>
                                <td class="subject_td">${review.prdName}<br>
                                    <a href="<c:url value='/community/detailViewReview/${review.postNo}'/>" class="title_td">${review.postTitle}</a>
                                </td>
                                <td class="writer_td">${review.memId}</td>
                                <td class="date_td"><fmt:formatDate value="${review.createdDate}" pattern="YYYY-MM-dd" /></td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>                   
            </div>
			<!-- bottom.jsp import -->
			<c:import url = "/WEB-INF/views/layout/bottom.jsp"></c:import>		
		</div>
	</body>
</html>
