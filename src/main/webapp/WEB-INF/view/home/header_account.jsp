<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>개인 정보</title>
		<link rel="stylesheet" href="<%=request.getContextPath() %>/css/home_css/header_account.css">
</head>
<body>
	<c:if test="${empty authInfo}">
		<div class= account_menu>
				<a href ="<c:url value='/login'/>" >로그인</a>&nbsp;&colon;&nbsp;
				<a href="<c:url value='/account/signUp1'/>">회원가입</a>
		</div>
	</c:if>
	<c:if test="${!empty authInfo}">
		<div class= account_menu>
				<a href = "<%=request.getContextPath() %>/home/header_logmenu" ><span>${authInfo.userName}</span>님 환영합니다.</a>
		</div>
	</c:if>
</body>
</html>