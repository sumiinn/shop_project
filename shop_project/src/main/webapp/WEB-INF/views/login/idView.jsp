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
		<script src="<c:url value='/js/findId.js'/>"></script>
	</head>
	<body>
		<div id="wrap">
			<section>
				<div class="login-container">
			        <form id="loginForm" action="/member/loginForm">
			            <h2>찾는 아이디</h2>
			            <label for="username">아이디</label>
			            <input type="text" id="memName" name="memName" value="${memId }" required readonly>
			            <div id="btnList">
				            <button onclick="location.href='/member/loginForm'">로그인</button>
			            </div>
			            <p id="errorMessage" class="error"></p>
			        </form>
			        <div class="options">
			            <button onclick="location.href='/member/signUp'">회원가입</button>
			            <button onclick="location.href='/member/loginForm'">로그인</button>
			            <button onclick="location.href='find_password.html'">비밀번호 찾기</button>
			        </div>
			    </div>
			</section>	
		</div>
	</body>
</html>