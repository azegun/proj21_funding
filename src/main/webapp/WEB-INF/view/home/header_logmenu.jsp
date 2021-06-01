<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>로그메뉴</title>
		<link rel="stylesheet" href="<%=request.getContextPath() %>/home_css/header_logmenu.css">
</head>
<body>
         <section id = "logon_infomation">
         <div><a href =   "" >마이페이지</a></div>
         <div><a href =   "" >회원정보관리</a>   </div>
         <div><a href =   "" >메시지</a></div>
         <div><a href =   "" >후원현황</a></div>
         <div><a href =   "" >등록한 프로젝트</a>   </div>
         <div><a href =   "" >관심 프로젝트</a></div>
         <section id = "logon_footer">
         <div><a href =   "" >설정</a></div>
         
         <c:if test="${empty authInfo}">    
         	<div><a href ="" >로그아웃</a></div>
         </c:if>
         <c:if test="${!empty authInfo}">   
        	 <div><a href ="<c:url value='/logout'/>" >로그아웃</a></div>  
         </c:if>   
          
         </section>
         </section>
         

</body>
</html>