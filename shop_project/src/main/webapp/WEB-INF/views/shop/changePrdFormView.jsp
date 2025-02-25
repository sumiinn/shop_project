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
		<script src="<c:url value='/js/changePrd.js'/>"></script>
	</head>
	<body>
		<div id="wrap">
			<!-- top.jsp import -->
			<c:import url = "/WEB-INF/views/layout/top.jsp"></c:import>
			<section>
				<h3>상품 정보 변경</h3>
				<hr><br>
				<form id="insertPrdForm"  action="/product/changePrd">
					<table>
						<tr>
							<th>상품번호</th>
							<td><input id="prdNo" name="prdNo" type="text">&nbsp<input type="button" id="load" value="상품 불러오기"/></td>
						</tr>
						<tr>
							<th>상품명</th>
							<td><input id="prdName" name="prdName" type="text" ></td>
						</tr>
						<tr>
							<th>가격</th>
							<td><input id="prdPrice" name="prdPrice" type="text"></td>
						</tr>
						<tr>
							<th>사이즈</th>
							<td>
								<input class ="scheckbox"type="checkbox" name="prdSize" value="XS"/>XS
								<input class ="scheckbox" type="checkbox" name="prdSize" value="S"/>S
								<input class ="scheckbox" type="checkbox" name="prdSize" value="M"/>M
								<input class ="scheckbox" type="checkbox" name="prdSize" value="L"/>L
								<input class ="scheckbox" type="checkbox" name="prdSize" value="XL"/>XL
								<input class ="scheckbox"type="checkbox" name="prdSize" value="XXL"/>XXL
							</td>
						</tr>
						<tr>
							<th>할인률</th>
							<td><input id="prdSale" name="prdSale" type="text"value="0"></td>
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
									<input class="subCategory" type="radio" name="scId" value="1001">SHIRTS
									<input class="subCategory" type="radio" name="scId" value="1002">SHORT-TEE
									<input class="subCategory" type="radio" name="scId" value="1003">LONG-TEE
									<input class="subCategory" type="radio" name="scId" value="1004">HOODIE
									<input class="subCategory" type="radio" name="scId" value="1005">ETC
								</div>
								<div id="subBottom" class="sCategory visibility">
									<input class="subCategory" type="radio" name="scId" value="2001">SHORT-PANTS
									<input class="subCategory" type="radio" name="scId" value="2002">LONG-PANTS
									<input class="subCategory" type="radio" name="scId" value="2003">ETC
								</div>
								<div id="subOuter" class="sCategory visibility">
									<input class="subCategory" type="radio" name="scId" value="3001">JACKET
									<input class="subCategory" type="radio" name="scId" value="3002">JUMPER
									<input class="subCategory" type="radio" name="scId" value="3003">COAT
									<input class="subCategory" type="radio" name="scId" value="3004">PADDING
									<input class="subCategory" type="radio" name="scId" value="3005">ETC
								</div>
								<div id="subHeadwear" class="sCategory visibility">
									<input class="subCategory" type="radio" name="scId" value="4001">CAP
									<input class="subCategory" type="radio" name="scId" value="4002">SNAPBACK
									<input class="subCategory" type="radio" name="scId" value="4003">BEANIE
									<input class="subCategory" type="radio" name="scId" value="4004">ETC
								</div>
								<div id="subAccessory" class="sCategory visibility">
									<input class="subCategory" type="radio" name="scId" value="5001">BAGS
									<input class="subCategory" type="radio" name="scId" value="5002">WALLET
									<input class="subCategory" type="radio" name="scId" value="5003">BELT
									<input class="subCategory" type="radio" name="scId" value="5004">SOCKS
									<input class="subCategory"stype="radio" name="scId" value="5005">ETC
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