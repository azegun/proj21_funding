<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/home_css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/account_css/searchPw.css">
</head>
<body>
	<div class="container">
		<header>		   
			<jsp:include page="/WEB-INF/view/home/header.jsp"/> 
		</header>
		<section id="searchPwArea">
			<h1>비밀번호 찾기</h1>
			<form:form action="searchPw-rs" modelAttribute="userSearch">
			<form:errors />
				<fieldset id="searchPwForm">
					<p>
						<label >회 원 계 정</label>:
						<form:input path="userId" id="input"/>						
					</p>
					<p id="errors"><form:errors path="userId"/>&nbsp;</p>
					<p>
						<label>회 원 성 명</label>:
						<form:input path="userName" id="input"/> 					
					</p>
					<p id="errors"><form:errors path="userName"/>&nbsp;</p>
					<p>
						<label> 이 메 일 </label>:
						<form:input path="email" id="input"/> 
					</p>
					<p id="errors"><form:errors path="email"/>&nbsp;</p>
				</fieldset>	
				<form:button id="search">비밀번호 찾기</form:button>
			</form:form>				
		</section>
		<footer>
			<jsp:include page="/WEB-INF/view/home/footer.jsp"/> 
		</footer>
	</div>
</body>
</html>