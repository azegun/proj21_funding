<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"	 %>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>헤더 메뉴</title>
		<link rel="stylesheet" href="<%=request.getContextPath() %>/css/home_css/header_menu.css">
</head>
<body>
					<div class="header_menu"> 		
					<c:choose>
							<c:when test="${empty authInfo }">
									<a href="<%=request.getContextPath() %>/home/menu">프로젝트 둘러보기</a>						
									<a href="<%=request.getContextPath() %>/uploadMain">프로젝트 올리기</a>				
							</c:when>
							<c:otherwise>
									<a href="<%=request.getContextPath() %>/home/menu">프로젝트 둘러보기</a>						
									<a href="<%=request.getContextPath() %>/uploadMain/${authInfo.userNo}">프로젝트 올리기</a>								
							</c:otherwise>				
					</c:choose>												
					</div>	
</body>
</html>

