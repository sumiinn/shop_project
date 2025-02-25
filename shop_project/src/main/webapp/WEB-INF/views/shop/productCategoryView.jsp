<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<!-- head.jsp import -->
		<c:import url = "/WEB-INF/views/layout/head.jsp"></c:import>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/categori.css'/>">
		<script src="<c:url value='/js/categori.js'/>"></script>
	</head>
	<body>
		<div id="wrap">
			<!-- top.jsp import -->
			<c:import url = "/WEB-INF/views/layout/top.jsp"></c:import>
			<section>
				<div id="categoriMain">
					<br>
					<div id= "categoriMainName">${subList[0].mcName }</div>
					<br><hr><br>
					<div id="classificationBox">
						<div id = "totalCategori" class="categoriBox selectBox">${subList[0].mcName }</div>
						<c:forEach items="${subList }" var="sub">
							<div id="${sub.scName }"class="categoriBox subCategori" data-ctgName="${sub.scName }" data-subNo="${sub.scId}">${sub.scName }</div>
						</c:forEach>
					</div>
					<!-- 베스트상품 슬라이드쇼 -->
					<c:if test = "${prdList.size() !='0'}">
						<article id="slideBox">
							<div>Best</div>
							<ul id="slideWrap">
								<c:forEach var="i" begin="0" end="2">
									<li class="slideItem">
										<c:forEach var="j" begin="0" end="3">	
											<%-- <a href="/product/productDetailView/${prdList[i*4+j].prdNo}">		 --%>						
												<div class="slideImage prdContent" data-prdno="${prdList[i*4+j].prdNo}">
													<img class="bestImg" src="<c:url value='/project_images/product/${prdList[i*4+j].mcId}/${prdList[i*4+j].prdImg.split(",")[0]}'/>">
													<div>${prdList[i*4+j].prdName }</div>
													<hr>
													<div class="bestPrice" data-price="${prdList[i*4+j].prdPrice }"></div>
												</div>
											<!-- </a> -->
										</c:forEach>
									</li>
								</c:forEach>
							</ul>
						</article>
					</c:if>
					<!-- 상품 리스트 -->
					<div id="actualProduct">
						<div id="apT">
							<div id="totalcount">
								<div id="countN"></div>
								<div>item</div>
							</div>
							<div id="viewMethod">
								<div id="tv">2</div>
								<div id="fv">4</div>
								<div id="sv">6</div>
								<div id="ev">8</div>
							</div>
						</div>
					</div>
					<hr>
					<div id="apB">
						<c:if test = "${prdList.size() !='0'}">
							<c:forEach items="${prdList }" var="prd">
								<div class="prdContent prdBox shirts fourCountG" data-sub="${prd.scId }" data-prdno="${prd.prdNo }">
									<div class="apBprdImg"><img src="<c:url value='/project_images/product/${prd.mcId}/${prd.prdImg.split(",")[0]}'/>"></div>
									<div class="apBprdText">
										<div class="tablePrdName">${prd.prdName  }</div>
										<hr>
										<div class="apBPrdPrice" data-price="${prd.prdPrice }"></div>
									</div>
								</div>
							</c:forEach>
						</c:if>
					</div>
				</div>
			</section>
			<!-- bottom.jsp import -->
			<c:import url = "/WEB-INF/views/layout/bottom.jsp"></c:import>
		</div>
	</body>
</html>