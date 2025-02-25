<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>장바구니</title>
		<!-- head.jsp import -->
		<c:import url = "/WEB-INF/views/layout/head.jsp"></c:import>
		<script src="<c:url value='/js/cart.js'/>"></script>
		<link rel="stylesheet"   type="text/css"  href="<c:url value='/css/info.css'/>">
		<link rel="stylesheet"   type="text/css"  href="<c:url value='/css/cart.css'/>">
		<link rel="stylesheet"   type="text/css"  href="<c:url value='/css/cartTable.css'/>">
	</head>
	<body>
	<div id="wrap">
		<!-- top.jsp import -->
		<c:import url="/WEB-INF/views/layout/top.jsp"></c:import>
		<br>
		<section>		
			<header>
				<h3>CART</h3>
				
				<nav>
					<ul>
						<li><a href="index.html">홈</a> &gt; <a href="#">장바구니</a></li>
					</ul>
				</nav>
			</header>
			<main>
			
				<div class='cartTabs'>
					<button id='domesticBtn' class="btn">국내 배송상품(${prdCount})</button>
					<p id="notice">장바구니에 담긴 상품은 30일 동안 보관됩니다.</p>
				</div>

				<div id="domesticCart">
				    <c:if test="${empty cartList}">
                       <p class='emptyMessage' id='emptyMsgDom'>장바구니가 비어있습니다.</p>
                    </c:if>
                    <c:if test="${not empty cartList}">                    
                      <p id="commonPrd">
					    일반상품(<span id="domestic-item-count">${prdCount}</span>)
					  </p>				
                  
					<table class="cartTable">						
						<tr>
							<th></th>
							<th>이미지</th>
							<th id="prdInfo">상품정보</th>
							<th id="prdAmount">수량</th>
							<th>상품구매금액</th>
							<th>적립금</th>
							<th>배송구분</th>
							<th>선택</th>
						</tr>		
										
						<c:set var="totalPrice" value="0" />
                        <c:set var="totalShipping" value="2500" /> 
                        
						<c:forEach var="prd" items="${cartList}">
							<tr>
								<td><input type="checkbox" class="itemCheckbox" value="${prd.cartNo}"></td>
								<td><img src="<c:url value='/project_images/product/${prd.mcId}/${prd.prdInfoImg}' />"></td>
								<td class="name"><a href="/product/productDetailView/${prd.prdNo}">${prd.prdName}</a><br>
								<small>[색상: ${prd.cartColor} / 사이즈: ${prd.cartSize}]</small></td>
								<td class="quantityWrap">								  
								    <input type="number" value="${prd.cartQty}" class="quantity" min="1">
								    <input type="hidden" name="cartNo" value="${prd.cartNo}">									                      
			               	        <input type="hidden" name="cartQty" value="${prd.cartQty}">							                         
							        <button class="update">변경</button>
							      
								</td>
								<td class="price" data-price="${prd.prdPrice}" data-amount="${prd.prdPrice * prd.cartQty}"> 
								   <fmt:formatNumber value="${prd.prdPrice * prd.cartQty}" pattern="#,###" /> 원
								</td>
								<td class="points" data-points="${prd.prdPrice * prd.cartQty * 0.01 }">
								   <fmt:formatNumber value="${prd.prdPrice * prd.cartQty * 0.01 }" pattern="#,###" /> 원
								</td>
								<td class="shipping">기본배송<br>2,500원</td>
								
								<td>
								  <form method="post" action="<c:url value='/orderForm'/>"> 
								    <input type="hidden" name="cartNo" value="${prd.cartNo}">									                      
			               			<input type="hidden" name="cartQty" value="${prd.cartQty}">	
									<button class="order">주문하기</button>
								  </form>							
									<button class="delete">삭제</button>
								</td>
								
							</tr>
						</c:forEach>													
					</table>										
				 
					<c:set var="totalPrice" value="0" />
                    <c:set var="totalShipping" value="2500" /> 
                    <c:forEach var="prd" items="${cartList}">
                    <span class="amount" data-amount="${prd.prdPrice * prd.cartQty}">
                        <c:set var="amount" value="${prd.prdPrice * prd.cartQty}" />
                        <c:set var="totalPrice" value="${totalPrice + amount}" />
                    </span>
                    </c:forEach> 
                     
					<table class="orderTable" id="domesticOrderTable">
						<thead>
							<tr>
								<th>총 상품금액</th>
								<th>총 배송비</th>
								<th>결제예정금액</th>
							</tr>
						</thead>
						<tbody>
							<tr>			
					            <td class="totalPrice">
                                    <fmt:formatNumber value="${totalPrice}" pattern="#,###" />원
                                </td>
                                <td class="totalShipping">+ 2,500원</td>
                                <td class="totalAmount">
                                    = <fmt:formatNumber value="${totalPrice + totalShipping}" pattern="#,###" />원
                                </td>			   								
							</tr>
						</tbody>
					</table>																	
                    </c:if>										
				</div>			 			
               
				<div class="prdOrder">
				  <form method="post" action="<c:url value='/orderForm'/>"> 
				    <input type="hidden" name="cartNo" value="${prd.cartNo}">
                    <input type="hidden" name="cartQty" value="${prd.cartQty}">
					<input type="submit" id="orderAll" value="전체상품주문">
					<input type="submit" id="orderSelected" value="선택상품주문">
				  </form>
				</div>  

				<div class="continueShop">
					<button id="continueShopBtn" onclick="location.href='/'">쇼핑계속하기</button>
				</div>
				
				<div class="information">
					<p id="infoDesk">이용안내</p>
					<hr>
					<div id="info">
						<h5>장바구니 이용안내</h5>
						<ol>
							<li>해외배송 상품과 국내배송 상품은 함께 결제하실 수 없으며 장바구니 별로 따로 결제해 주시기 바랍니다.</li>
							<li>해외배송 가능 상품의 경우 국내배송 장바구니에 담아두기 하여 해외배송 장바구니로 이동하여 결제하실 수
								있습니다.</li>
							<li>선택하신 상품의 수량을 변경하신뒤에 수량변경 버튼을 누르시면 됩니다.</li>
							<li>삭제하시기를 누르시면 장바구니 상품을 삭제할 수 있습니다.</li>
							<li>장바구니에 관심상품을 이용하여 여러 상품을 한번에 주문하실 수 있습니다.</li>
							<li>파일첨부 옵션은 동일상품을 장바구니에 추가할 경우 마지막에 업로드 한 파일로 교체됩니다.</li>
						</ol>
					</div>
					<div id="info">
						<h5>무이자할부 이용안내</h5>
						<ol>
							<li>상품을 무이자할부 혜택을 받으시려면 무이자할부 상품만 선택하여 (주문하기) 버튼을 눌러
								주문/결제하시면 됩니다.</li>
							<li>점검시간 이후 접수된 누적된 장바구니내 상품들에 대한 주문/결제 가 이루어집니다.</li>
							<li>단, 사전에 상품을 주문/결제하실 경우, 상품을 무이자할부 혜택을 받으실 수 없습니다.</li>
							<li>무이자할부 혜택을 받으시려면 무이자할부 상품의 기준으로 배송비가 표시됩니다.</li>
							<li>실제 배송비는 함께 주문하는 상품에 따라 적용되오니 주의하시기 바랍니다.</li>
						</ol>
					</div>
				</div>
			</main>
			
		</section>
		<!-- bottom.jsp import -->
		<c:import url="/WEB-INF/views/layout/bottom.jsp"></c:import>
	</div>
</body>
</html>
