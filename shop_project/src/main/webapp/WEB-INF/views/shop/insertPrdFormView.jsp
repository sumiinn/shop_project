<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet"   type="text/css"  href="<c:url value='/css/insertTable.css'/>">
		<!-- head.jsp import -->
		<c:import url = "/WEB-INF/views/layout/head.jsp"></c:import>
		<script src="<c:url value='/js/insertPrd.js'/>"></script>
	</head>
	<body>
		<div id="wrap">
			<!-- top.jsp import -->
			<c:import url = "/WEB-INF/views/layout/top.jsp"></c:import>
			<section>
				<h3>상품 추가</h3>
				<hr><br>
				<form id="insertPrdForm"  action="/product/insertPrd">
					<table>
						<tr>
							<th>상품번호</th>
							<td><input id="prdNo" name="prdNo" type="text">&nbsp<input type="button" id="check" value="중복확인"/></td>
						</tr>
						<tr>
							<th>상품명</th>
							<td><input name="prdName" type="text" ></td>
						</tr>
						<tr>
							<th>가격</th>
							<td><input name="prdPrice" type="text"></td>
						</tr>
						<tr>
							<th>사진</th>
							<td><input name="prdImg" type="file" id="prdImg" 
								 multiple="multiple"></td>
						</tr>
						<tr>
							<th>상세정보사진</th>
							<td><input name="prdInfoImg" type="file" id="prdInfoImg" 
								 multiple="multiple"></td>
						</tr>
						<tr>
							<th>색상</th>
							<td><input name="prdColor" type="file" id="prdColor" 
								 multiple="multiple"></td>
						</tr>
						<tr>
							<th>사이즈</th>
							<td>
								<input type="checkbox" name="prdSize" value="XS"/>XS
								<input type="checkbox" name="prdSize" value="S"/>S
								<input type="checkbox" name="prdSize" value="M"/>M
								<input type="checkbox" name="prdSize" value="L"/>L
								<input type="checkbox" name="prdSize" value="XL"/>XL
								<input type="checkbox" name="prdSize" value="XXL"/>XXL
							</td>
						</tr>
						<tr>
							<th>할인률</th>
							<td><input name="prdSale" type="text"value="0"></td>
						</tr>
						<tr>
							<th>분류</th>
							<td>
								<input class="mainCategory" type="radio" name="mcId" value="1">TOP
								<input class="mainCategory" type="radio" name="mcId" value="2">BOTTOM
								<input class="mainCategory" type="radio" name="mcId" value="3">OUTER
								<input class="mainCategory" type="radio" name="mcId" value="4">HEADWEAR
								<input class="mainCategory" type="radio" name="mcId" value="5">ACCESSORY
							</td>
						</tr>
						<tr>
							<th>상세 분류</th>
							<td>
								<div id="subTop" class="sCategory visibility">
									<input type="radio" name="scId" value="1001">SHIRTS
									<input type="radio" name="scId" value="1002">SHORT-TEE
									<input type="radio" name="scId" value="1003">LONG-TEE
									<input type="radio" name="scId" value="1004">HOODIE
									<input type="radio" name="scId" value="1005">ETC
								</div>
								<div id="subBottom" class="sCategory visibility">
									<input type="radio" name="scId" value="2001">SHORT-PANTS
									<input type="radio" name="scId" value="2002">LONG-PANTS
									<input type="radio" name="scId" value="2003">ETC
								</div>
								<div id="subOuter" class="sCategory visibility">
									<input type="radio" name="scId" value="3001">JACKET
									<input type="radio" name="scId" value="3002">JUMPER
									<input type="radio" name="scId" value="3003">COAT
									<input type="radio" name="scId" value="3004">PADDING
									<input type="radio" name="scId" value="3005">ETC
								</div>
								<div id="subHeadwear" class="sCategory visibility">
									<input type="radio" name="scId" value="4001">CAP
									<input type="radio" name="scId" value="4002">SNAPBACK
									<input type="radio" name="scId" value="4003">BEANIE
									<input type="radio" name="scId" value="4004">ETC
								</div>
								<div id="subAccessory" class="sCategory visibility">
									<input type="radio" name="scId" value="5001">BAGS
									<input type="radio" name="scId" value="5002">WALLET
									<input type="radio" name="scId" value="5003">BELT
									<input type="radio" name="scId" value="5004">SOCKS
									<input type="radio" name="scId" value="5005">ETC
								</div>
							</td>
						</tr>
					</table><br>
					<div id="btnDiv">
						<input class="tableBtn" type="submit" value="등록">
						<input class="tableBtn" type="reset" value="초기화">
					</div>
				</form>
			<hr>
			</section>
			<!-- bottom.jsp import -->
			<c:import url = "/WEB-INF/views/layout/bottom.jsp"></c:import>		
		</div>
	</body>
</html>