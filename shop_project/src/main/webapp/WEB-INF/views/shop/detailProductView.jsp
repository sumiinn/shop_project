<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet"   type="text/css"  href="<c:url value='/css/detailedProduct.css'/>">
		<!-- head.jsp import -->
		<c:import url = "/WEB-INF/views/layout/head.jsp"></c:import>
		<script src="<c:url value='/js/detailedProduct.js'/>"></script>
	</head>
	<body>
		<div id="wrap">
			<!-- top.jsp import -->
			<c:import url = "/WEB-INF/views/layout/top.jsp"></c:import>
			
			<!--모달 팝업-->
		<div id="prdModal" class="modal">
		</div> 
		<!--end 모달 팝업-->
			
			<section>
				<div class="mainBody">
					<form class="moreInfoF" method="post" action="<c:url value='/shop/insertCart' />"> <!--  구매및 사진 -->
						<div class="infoImg"> <!--  사진 영역 -->
							<div> 
								<img id="infoBig" class="infoBig"  src="<c:url value='/project_images/product/${prd.mcId}/${prd.prdImg.split(",")[0]}'/>">
							</div>
							<div class="infoSmall">
								<c:forEach items="${prdImgList }" var="prdImg">
									<img class="imgSmall" src="<c:url value='/project_images/product/${prd.mcId}/${prdImg }'/>">
								</c:forEach>
							</div>
						</div>
						<div class="prdInfo" id="prdInfoArea"><!--  정보 영역 -->
						    <input type="hidden" name="prdNo" value="${prd.prdNo}"> 	
						    <input type="hidden" id="selectedColor" name="cartColor" value="">
                            <input type="hidden" id="selectedSize" name="cartSize" value="">					    
                            <!-- <input type="hidden" name="cartQty" value="1">    -->                 
							${prd.prdName } 
							<c:if test="${not empty sessionScope.sid && not empty sessionScope.mid}">
								<span id="deleteBtn" data-prdno="${prd.prdNo }" data-mcid="${prd.mcId }">🗑️</span>
							</c:if> 
							<br>
							<a href="<c:url value = '/product/productCtgList/${prd.mcId}'/>">◾ ${prd.mcName}</a>
							<br><hr><br>
							<table>
								<tr>
									<th>판매가</th>
									<td><span id="clothesCost" data-Price="${prd.prdPrice  }"></span></td>									
								</tr>
								<tr>
									<th>포인트</th>
									<td><span id="point"></span></td>
								</tr>
							</table>
							<br><hr><br>
							<table>
								<tr>
									<th>color</th>
									<td >
										<c:if test="${not empty colorList[0] }"> 
											<c:forEach items="${colorList}" var="col">									                                                        
												<img class="colorEx" data-color="${col }"  name="${col} " alt="" src="<c:url value='/project_images/prd_colors/${col}'/>">										
											</c:forEach>
										</c:if>
									</td>
								</tr>
								<tr>
									<th>size</th>
									<td>
										<select id="size" name="size">
											<c:choose>
												<c:when test="${empty sizeList[0] }">
													<option value="F">프리 사이즈 입니다.</option>
												</c:when>
												<c:when test="${not empty sizeList[0] }">
													<option value="none">[필수]사이즈 선택</option>
													<c:forEach items="${sizeList }" var = "size">
														<option class="sizeC" data-size="${size }"value="${size }">${size }</option>							
													</c:forEach>
												</c:when>
											</c:choose>
										</select>
									</td>
								</tr>
							</table>
							<br><hr><br>
							<div id="finalCheck">
								<div>
									<table>
										<tr  id= "countNo"class="visibility">
											<th>수량</th>
											<td>
												<input type='number'  id="numberCheck"name="cartQty" value="1">
											</td>
										</tr>
									</table>
								</div>
								<div id="totalPrice">
									TOTAL :&nbsp;<span id="sumCost">0원</span>
								</div>
							</div>
							<div id="buttonBar" class="visibility">							  
								<button id='insertCart' class='shopBtn'>장바구니 넣기</button>								
								<button id='purchase' class='shopBtn'>상품 구매하기</button>
							</div>
						</div>
					</form>
				</div>
				<hr>
				<!-- 리뷰 -->
				<div id="reviewBox">
					<c:choose>
						<c:when test="${not empty reviewList[0]  }">
							<table id="reviewTable" >
								<tr ><th colspan='4' class="classificationP">BEST REVIEW</th></tr> 
								<tr id="tableCategory">
									<th>번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>평점</th>
								</tr>
								<c:forEach items="${reviewList }" var="review" varStatus="status">
									<tr class="reviewTableTr">
										<td>${status.count}</td>
										<td>${review.title }</td>
										<td>${review.memId }</td>
										<td class="reviewScore" data-score="${review.score }"> </td>
									</tr>
									<tr class="reviewContent visibility">
										<td colspan='3'>${review.detail }</td>
										<td><img src="<c:url value='/project_images/review/${review.img.split(",")[0]}'/>"></td>
									</tr>
								</c:forEach>
							</table>
						</c:when>
						<c:otherwise >
							<div id="nonReivew">리뷰 글이 없습니다.</div>
						</c:otherwise>
					</c:choose>
				</div>
				
				<!-- 추천 제품 -->
				<div>
					<table id="suggestionTable">
						<tr ><th colspan='5' class="classificationP">추천 상품</th></tr> 
						<tr>
							<c:forEach items="${prdRList }" var="prdR">
								<td>
									<div class = "suggestion" data-prdNo="${prdR.prdNo }">
										<div><img class = "suggestionImage" src="<c:url value='/project_images/product/${prdR.mcId }/${prdR.prdImg.split(",")[0]}'/>"></div>
										<div class="nameBasket">
											<span class="suggestionName">${prdR.prdName }</span>
											<span class="suggestionCost"><fmt:formatNumber value="${prdR.prdPrice }"/> 원</span>
										</div>
									</div>
								</td>
							</c:forEach>
						</tr>
					</table>
				</div>
				<hr>
				<!-- 상세 정보 -->
				<div id="moreImg">
					<c:if test="${not empty prdInfoImg[0] }">
						<c:forEach items="${prdInfoImg }" var="infoImg">
							<img src="<c:url value = '/project_images/prd_info/${infoImg}'/>">
						</c:forEach>
					</c:if>
				</div>
				<span id="rollUp">🔺</span>
			</section>
			<!-- bottom.jsp import -->
			<c:import url = "/WEB-INF/views/layout/bottom.jsp"></c:import>		
		</div>
	</body>
</html>