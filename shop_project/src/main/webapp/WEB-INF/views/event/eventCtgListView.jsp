<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>이벤트</title>
		<!-- head.jsp import -->
		<c:import url = "/WEB-INF/views/layout/head.jsp"></c:import>
		<script src="<c:url value='/js/event.js'/>"></script>
		<link rel="stylesheet"   type="text/css"  href="<c:url value='/css/event.css'/>">
	</head>
	<body>
	<div id="wrap">
		<!-- top.jsp import -->
		<c:import url="/WEB-INF/views/layout/top.jsp"></c:import>
		<section>
			<header>
				<h3>EVENT</h3>
			</header>
			<img src="/image/Banner/eventBanner_2.png" class="eventImg">
			<div>
				<div class='eventBtn'>
					<button class="btn" data-discount='all'>ALL</button>
					<button class="btn" data-discount="1">1+1</button>
					<button class="btn" data-discount="2">11%</button>
					<button class="btn" data-discount="3">22%</button>
				</div>
				<div class="sort">
					<select id="sortOptions">
						<option value="default">-정렬방식-</option>
						<option value="new">신상품</option>
						<option value="priceAsc">낮은가격</option>
						<option value="discountDesc">높은가격</option>
					</select>
				</div>
			</div>
			<main>
				<div id="productBox">
				<c:forEach var="event" items="${eventList}">			
				  <div class="product" data-discount="${event.eventCtgId}">
						<div class="prdItem">
							<div>
								<a href="/product/productDetailView/${event.prdNo}">
								  <img src="<c:url value='/project_images/product/1/${event.eprdImg}' />">
								</a>
							</div>
							<p class="prdName">
								<a href="/product/productDetailView/${event.prdNo}">${event.eprdName}</a>&nbsp; 
								<span class="event"> 
								<c:choose>
									<c:when test="${event.eventCtgId == 1}">
                                    1+1 EVENT
                                    </c:when>
									<c:when test="${event.eventCtgId == 2}">
                                    11% SALE
                                    </c:when>
									<c:when test="${event.eventCtgId == 3}">
                                    22% SALE
                                    </c:when>						
								</c:choose>		
								</span>							
							</p>
							<p class="prdSize">2 color / 3 size</p>
							<p class="prdPrice">
							  <c:choose>
							    <c:when test="${event.eventCtgId == 1}">
							      <fmt:formatNumber value="${event.eprdPrice}" pattern="#,###" /> 원
							    </c:when>
							    <c:otherwise>
							      <span class="prdPriceOrigin">
							        <fmt:formatNumber value="${event.eprdPrice}" pattern="#,###" />원
							      </span> 							
							      <span class="prdPriceSale">                               
							        &nbsp;<fmt:formatNumber value="${event.eprdPrice * (1 - event.eprdDiscount/100)}" pattern="#,###" /> 원
							      </span>
							    </c:otherwise>
							  </c:choose>
							  
							</p>
						</div>
				  </div>					  		  
				</c:forEach>																										
				</div>
			</main>
		</section>
		<!-- bottom.jsp import -->
		<c:import url="/WEB-INF/views/layout/bottom.jsp"></c:import>
	</div>
</body>
</html>
