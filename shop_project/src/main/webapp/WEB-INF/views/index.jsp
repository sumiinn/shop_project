<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Nonmajor5</title>
		<!-- head.jsp import -->
		<c:import url = "/WEB-INF/views/layout/head.jsp"></c:import>
 		<link rel="stylesheet"   type="text/css"  href="<c:url value='/css/common.css'/>">
		<link rel="stylesheet"   type="text/css"  href="<c:url value='/css/mainSlideShow.css'/>">
		<link rel="stylesheet"   type="text/css"  href="<c:url value='/css/mainProduct.css'/>">
		<script src="<c:url value='/js/slideShow.js'/>"></script>
		<script src="<c:url value='/js/video.js'/>"></script>
	</head>
	<body>
		<div id="wrap">
			<!-- top.jsp import -->
			<c:import url = "/WEB-INF/views/layout/top.jsp"></c:import>
			<section id="pageArea">
				<article id="slideShow"> <!-- 슬라이드 쇼  -->
				
					<div id="slideShowBox">
						<div id="slidePanel">
							<img src= "<c:url value='/project_images/banner/slide17.png'/>" class="slideImage">
							<img src= "<c:url value='/project_images/banner/slide7.png'/>" class="slideImage">
							<img src= "<c:url value='/project_images/banner/slide14.png'/>" class="slideImage">
							<img src= "<c:url value='/project_images/banner/slide16.png'/>" class="slideImage">
							<img src= "<c:url value='/project_images/banner/slide6.png'/>" class="slideImage">
						</div>
					</div> <!-- slideShowBox 끝 -->
					
				</article>
				
				<article id="content1">
						
						<div id="ment">
						    <br><br><br>
							<h4>Suggestions for an elegant life</h4><br><br>

                 			하루 중 모든 순간에 조화로운 아이템과 시간이 지나도 변치 않는 가치로<br>
                 			더 쾌적하고 여유롭게, 나만의 라이프 스타일을 재정의 합니다.<br><br>

							<h4>CS OPEN HOURS</h4><br>
							<h4>MON-FRI 10:00 ~ 16:00</h4><br>
							<h4>SAT.SUN.HOLIDAY OFF</h4><br><br>

							<h4>Kakao. @NONMAJOR5</h4><br>
							<h4>Tel. 032-123-4567</h4>
						</div>
						<br><br>
						<div id="tabContent">
						    <video id="myVideo" width="960" height="480" controls muted autoplay>
                            <source src="<c:url value='/project_images/banner/video.mp4'/>" type="video/mp4">
                            </video>
						</div>	
				
				</article>
					<br><br>
					<article id="content2"> <!-- 베스트 상품 -->
					<div class="best"><h4> 베스트 상품</h4>  <h6><a href="categori.html" style="text-decoration:none; color:gray;">더 많은 상품 보기</a></h6></div>
						<div id="productBox">
							
							<div class="product">
							    <c:forEach items="${bestPrdList }" var="prdB">
							    	<div><a href="<c:url value='/product/productDetailView/${prdB.prdNo }'/>" style="text-decoration:none; color:black;">
							    		<img src="<c:url value='/project_images/product/${prdB.mcId}/${prdB.prdImg.split(",")[0] }'/>" >${prdB.prdName } <br>
							            <fmt:formatNumber value="${prdB.prdPrice }"/> 원
							        </a></div>
							    </c:forEach>
							</div>
						</div>
					</article>
				
					<article id="content2"> <!-- 새로운 상품 -->
						<div class="new" ><h4 >새로운 상품</h4>   <h6><a href="categori.html" style="text-decoration:none; color:gray;">더 많은 상품 보기</a></h6></div>
						<div id="productBox">
						
							<div class="product">
								<c:forEach items="${newPrdList }" var="prdN">
							    	<div><a href="<c:url value='/product/productDetailView/${prdN.prdNo }'/>" style="text-decoration:none; color:black;">
							    		<img src="<c:url value='/project_images/product/${prdN.mcId}/${prdN.prdImg.split(",")[0] }'/>" >${prdN.prdName } <br>
							            <fmt:formatNumber value="${prdN.prdPrice }"/> 원
							        </a></div>
							    </c:forEach>

							</div>
						</div>
					</article>
			</section>
			<!-- bottom.jsp import -->
			<c:import url = "/WEB-INF/views/layout/bottom.jsp"></c:import>		
		</div>
	</body>
</html>