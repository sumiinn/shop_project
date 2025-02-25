<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<!-- head.jsp import -->
		<c:import url = "/WEB-INF/views/layout/head.jsp"></c:import>
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<link rel="stylesheet"   type="text/css"  href="<c:url value='/css/signUp.css'/>">
		<script src="<c:url value='/js/signUp.js'/>"></script>
	</head>
	<body>
		<div class="signup-container">
        <h1>회원가입</h1>
        <form id="signupForm" action="/member/insertmem">
        	<div id="idArea" >
	            <input type="text" id="username" name="memId" placeholder="아이디" required>
	            <input type="button" id="searchId" name="searchId" value="중복체크">
        	</div>
            <input type="password" id="password" name="memPw" placeholder="비밀번호" required>
            <input type="password" id="passwordCheck" placeholder="비밀번호 확인" required>
            <input type="text" id="name" name="memName" placeholder="이름" required>
            <input type="email" id="email" name="memEmail" placeholder="이메일" required>
            <input type="text" id="phone" name="memHP" placeholder="전화번호" required>
            <div id="zip">
	            <input type="text" id="zipcode" name="memZipcode" placeholder="우편번호" required>
	            <input type="button" id="searchZipBtn" name="searchZipBtn" value="우편번호 찾기">
            </div>
            <input type="text" id="address1" name="memAddress1" placeholder="주소" required>
            <input type="text" id="address2" name="memAddress2" placeholder="상세 주소" required>
            <button id="submitBtn"type="button">회원가입</button>
        </form>
        <a href="<c:url value='/member/loginForm'/>">뒤로 가기</a>
    </div>
	</body>
</html>