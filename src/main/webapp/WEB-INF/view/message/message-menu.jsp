<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메세지 메뉴</title>
</head>
<body>
	<section id = "logon_infomation">
		<div><a href ="<c:url value='/message/message-write'/>" >메세지 보내기</a></div>
		<div><a href ="<c:url value='/message/message-receive'/>" >받은 쪽지함</a></div>
		<div><a href ="<c:url value='/message/message-unRead'/>" >안 읽은 쪽지 모아보기</a></div>		
		<div><a href ="<c:url value='/message/message-send'/>" >보낸 쪽지함</a></div>		         
	</section>
</body>
</html>