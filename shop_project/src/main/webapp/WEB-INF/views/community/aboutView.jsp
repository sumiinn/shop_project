<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>ABOUT</title>
		<!-- head.jsp import -->
		<c:import url = "/WEB-INF/views/layout/head.jsp"></c:import>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/community.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/comm_about.css'/>">
	</head>
	<body>
		<div id="wrap">
			<!-- top.jsp import -->
			<c:import url = "/WEB-INF/views/layout/top.jsp"></c:import>
			    <div class="container">
                    <div id="containerLeft">
                       <h1>COMMUNITY</h1>
                       <div class="sidebar">
                           <ul>
                               <li><a href="<c:url value='/community/communityView'/>">ABOUT</a></li>
                               <li><a href="<c:url value='/community/noticeView'/>">NOTICE</a></li>
                               <li><a href="#">FAQ</a></li>
                           </ul>
                       </div>
                    </div>
                    <div class="content">                      
                        <div class="aboutImg">
                            <img src="<c:url value='/project_images/community/aboutNonmajor.jpg'/>">
                        </div>
                        <div class="aboutContent">
                            ${aboutList.postDetail}
                        </div>                      
                   </div>
               </div>
			<!-- bottom.jsp import -->
			<c:import url = "/WEB-INF/views/layout/bottom.jsp"></c:import>		
		</div>
	</body>
</html>
