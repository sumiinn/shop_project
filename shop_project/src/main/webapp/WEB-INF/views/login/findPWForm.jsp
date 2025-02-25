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
		<link rel="stylesheet"   type="text/css"  href="<c:url value='/css/login.css'/>">
		<script src="<c:url value='/js/login.js'/>"></script>
	</head>
	<body>
		<div id="wrap">
			<section>
				<div class="login-container">
			        <form id="loginForm">
			            <h2>아이디 찾기</h2>
			            <label for="username">아이디</label>
			            <input type="text" id="username" name="username" required>
			            <label for="password">비밀번호</label>
			            <input type="password" id="password" name="password" required>
			            <div id="btnList">
				            <button class="btnL" type="submit" id="loginButton">로그인</button>
				            <div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
				            <button class="btnL" type="button" id="backButton">돌아가기</button>
			            </div>
			            <p id="errorMessage" class="error"></p>
			        </form>
			        <div class="options">
			            <button onclick="location.href='/member/signUp'">회원가입</button>
			            <button onclick="location.href='find_id.html'">아이디 찾기</button>
			            <button onclick="location.href='find_password.html'">비밀번호 찾기</button>
			        </div>
			    </div>
			</section>	
		</div>
	</body>
</html>