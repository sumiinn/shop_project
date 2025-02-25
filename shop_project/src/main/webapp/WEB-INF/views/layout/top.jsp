<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   

	<div id="headerBox">
		<ul id="topMenuLeft">
			<li>즐겨찾기</li>
			<li>바로가기</li>				
		</ul>
		<ul id="topMenuRight">
			<!-- session 값에 따라 다르게 메뉴 항목 출력  -->
			<!-- 로그인 하지 않은 경우 : 로그인, 회원가입 -->
			<c:if test="${empty sessionScope.sid }">
				<li><a href="<c:url value='/member/loginForm'/>">로그인</a></li>
				<li><a href="<c:url value='/member/signUp'/>">회원가입</a></li>
				<li><a href="<c:url value='/event'/>">이벤트</a></li>
				<li><a href="<c:url value='/community/communityView'/>">커뮤니티</a></li>
			</c:if>
			
			<!-- 로그인 성공한 경우 : 로그아웃, 게시판, 장바귀, 마이페이지 -->
			<c:if test="${not empty sessionScope.sid && empty sessionScope.mid}">
				<a href="<c:url value='/member/logout'/>">로그아웃</a> 
				<a href="<c:url value='/community/communityView'/>">커뮤니티</a> 
				<a href="<c:url value='/event'/>">이벤트</a>
				<a href="<c:url value='/cartList'/>">장바구니</a> 
				<a href="<c:url value='/member/joinForm'/>">마이페이지</a> 
			</c:if>
			<c:if test="${not empty sessionScope.sid && not empty sessionScope.mid}">
				관리자 아이디 입니다. 
				<a href="<c:url value='/member/logout'/>">로그아웃</a> 
				<a href="<c:url value='/community/communityView'/>">커뮤니티</a>
				<a href="<c:url value='/event'/>">이벤트</a>
				<a href="<c:url value='/product/insertPrdForm'/>">상품추가</a>
				<a href="<c:url value='/product/changePrdForm'/>">상품정보변경</a>
			</c:if>
		</ul>		
	</div>
	<div id="menuLogo">
		<img id="menuLogoImg" src="<c:url value='/image/Icons/logo.png'/>">
	</div>
	<nav id="headMenu">
		<div id="mainMenuBox">
			<ul id="menuItem">
				<li><a href="<c:url value = '/product/productCtgList/${1}'/>">TOP</a></li>
				<li><a href="<c:url value = '/product/productCtgList/${2}'/>">BOTTOM</a></li>
				<li><a href="<c:url value = '/product/productCtgList/${3}'/>">OUTER</a></li>
				<li><a href="<c:url value = '/product/productCtgList/${4}'/>">HEADWEAR</a></li>
				<li><a href="<c:url value = '/product/productCtgList/${5}'/>">ACCESSORY</a></li>
			</ul>
		</div> <!--  mainMenuBox 끝 -->
		<div id = "subMenuBox" class="visibility">
			<div class="subMenuItem" id="subMenuItem1">
				<ul>
					<li><a href="<c:url value = '/product/productCtgList/${1}'/>">TOP</a></li>
					<li><a href="<c:url value = '/product/productCtgList/${2}'/>">SHIRTS</a></li>
					<li><a href="<c:url value = '/product/productCtgList/${3}'/>">SHORT-TEE</a></li>
					<li><a href="<c:url value = '/product/productCtgList/${4}'/>">LONG-TEE</a></li>
					<li><a href="<c:url value = '/product/productCtgList/${4}'/>">HOODIE</a></li>
					<li><a href="<c:url value = '/product/productCtgList/${4}'/>">ETC</a></li>
				</ul>
			</div>
			<div class="subMenuItem" id="subMenuItem2">
				<ul>
					<li><a href="<c:url value = '/product/productCtgList/${2}'/>">BOTTOM</a></li>
					<li><a href="#">SHORT-PANTS</a></li>
					<li><a href="#">LONG-PANTS</a></li>
					<li><a href="#">ETC</a></li>
				</ul>
			</div>
			<div class="subMenuItem" id="subMenuItem3">
				<ul>
					<li><a href="<c:url value = '/product/productCtgList/${3}'/>">OUTER</a></li>
					<li><a href="#">JACKET</a></li>
					<li><a href="#">JUMPER</a></li>
					<li><a href="#">COAT</a></li>
					<li><a href="#">PADDING</a></li>
					<li><a href="#">ETC</a></li>
				</ul>
			</div>
			<div class="subMenuItem" id="subMenuItem4">
				<ul>
					<li><a href="<c:url value = '/product/productCtgList/${4}'/>">HEADWEAR</a></li>
					<li><a href="#">CAP</a></li>
					<li><a href="#">SNAPBACK</a></li>
					<li><a href="#">BEANIE</a></li>
					<li><a href="#">ETC</a></li>
				</ul>
			</div>
			<div class="subMenuItem" id="subMenuItem5">
				<ul>
					<li><a href="<c:url value = '/product/productCtgList/${5}'/>">ACCESSORY</a></li>
					<li><a href="#">BAGS</a></li>
					<li><a href="#">WALLET</a></li>
					<li><a href="#">BELT</a></li>
					<li><a href="#">SOCKS</a></li>
					<li><a href="#">ETC</a></li>
				</ul>
			</div>
		</div>
	</nav>
<div class="quickmenu" >
	<ul>
		<li id="upBtn" >맨 위로</li>
			<button onclick="window.open('chatbot.html', 'window_name', 'width=430, height=600, location=no, status=no, scrollbars=yes');">챗봇상담</button>
		<li id="review">후기</li>
	</ul>
</div>
