<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
	<style>
   		footer {
       		display: flex;
       		justify-content: space-between; /* 박스 간의 간격을 균등하게 */
       		background-color: #ffffff; /* 배경색 */
       		padding: 20px; /* 패딩 */
       		margin-right:100px;
   			}
   
   		.footer-box {
      			 background-color: #ccc; /* 박스 배경색 */
       		 padding: 30px; /* 박스 패딩 */
       		 flex: 1; /* 박스들이 동일한 너비를 가지도록 */
       		 margin: 0 300px; /* 박스 간의 간격 */
      	   		 text-align: center; /* 텍스트 중앙 정렬 */
   			 }
   
   		/* 첫번째와 마지막 박스의 margin 조정 */
   		.footer-box:first-child {
       		margin-left: 0;
   		 }
   
   		.footer-box:last-child {
       		margin-right: 0;
   		 }
    </style>
</head>   
<footer>
	<div class="footer-Box">
		<h6>TEL 032-123-1234 MON-FRI 10:00 ~ 16:00<br>
	             (LUNCH TIME 12:00 ~ 13:00)<br>
	             SAT.SUN.HOLIDAY OFF<br>
	             COMPANY:주식회사 NONMAJOR5 CEO:고양이 인천시 서구 이음3로 ABC타워 302호<br>
	             BUSINESS LICENSE:123-34-67890 제 1234-인천서구-1234호<br>
	             CPO:강아지(asd123@naver.com)</h6>
	</div>
	<div class="footer-Box">
		<h6>교환 &amp; 반품<br>
		인천시 서구 이음3로<br>
		ABC타워 302호<br>
		<br>
		KB국민 123456-00-123456<br>
		예금주 : 주식회사 논메이저5</h6>
	</div>
	<div class="footer-Box">
		<h6><a href="http://www.instagram.com" style="text-decoration:none; color:black;">INSTAGRAM</a><br><br></h6>
		<h6><a href="http://section.blog.naver.com" style="text-decoration:none; color:black;">BLOG</a><br><br></h6>
		<h6><a href="https://www.youtube.com" style="text-decoration:none; color:black;">YOUTUBE</a><br><br></h6>
	</div>
	<div>
		<h6><a href="https://top.cafe.daum.net/" style="text-decoration:none; color:black;">CAFE</a><br><br></h6>
		<h6><a href="https://www.kakaocorp.com/page/service/service/KakaoTalkChannel" style="text-decoration:none; color:black;">KAKAOTALK</a><br><br></h6>
		<h6><a href="http://localhost:8080/NonMajor55/index.html#" style="text-decoration:none; color:black;">HOMPAGE</a><br><br></h6>
	</div>
</footer>