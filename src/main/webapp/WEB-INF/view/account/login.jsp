<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/home_css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/account_css/login.css">
</head>
<body>
	<div class="container">
		<header>		   
			<jsp:include page="/WEB-INF/view/home/header.jsp"/> 			
		</header>
		<section id="loginFormArea">
			<h1>로그인</h1>
			<form:form modelAttribute="userLogin">
			<form:errors />
				<fieldset id="loginUser">
					<p>
						<label>회원계정:<br>
						<form:input path="userId" id="input"/></label>
					</p>
					<p id="errors"><form:errors path="userId" />&nbsp;</p>										
					<p>
						<label>비밀번호:<br>
						<form:password path="userPw" id="input"/></label>
					</p>
					<p id="errors"><form:errors path="userPw"/>&nbsp;</p>							
					<p id="remember">
						<label><form:checkbox path="rememberUserId"/>아이디 기억하기</label>
					</p>
					<form:button id="login">로 그 인</form:button>				
				</fieldset>	
			</form:form>					
			<fieldset id="hrefBtn">
				<p>아직 계정이 없으신가요??<a href="<c:url value='/account/signUp1'/>">회원가입하기</a></p>
				<p><a href="<c:url value='/account/searchAccount'/>">아이디/비밀번호를 잊으셨나요??</a>
			</fieldset>					
		</section>
	</div>
</body>
</html>