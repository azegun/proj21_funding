<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보관리</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/home_css/main.css">
</head>
<body>
	<p>비밀번호가 변경되었습니다.</p>
	<a href="<c:url value='/main'/>"><button type="button">메인화면으로가기</button></a>
</body>
</html>