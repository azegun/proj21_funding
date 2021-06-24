<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/home_css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/account_css/searchId.css">
</head>
<body>
	<div class="container">
		<header>		   
			<jsp:include page="/WEB-INF/view/home/header.jsp"/> 
		</header>
		<section id="searchIdArea">
			<h1>회원계정 찾기</h1>
			<form:form action="searchId-rs" modelAttribute="userSearch">
			<form:errors />
				<fieldset id="searchIdForm">
					<p>
						<label>회 원 성 명</label>:<br>
						<form:input path="userName" id="input"/> 					
					</p>
					<p id="errors"><form:errors path="userName"/>&nbsp;</p>
					<p>
						<label> 이 메 일 </label>:<br>
						<form:input path="email" id="input"/> 
					</p>
					<p id="errors"><form:errors path="email"/>&nbsp;</p>
				</fieldset>				
				<form:button>아이디 찾기</form:button>					
			</form:form>				
		</section>
		<footer>
			<jsp:include page="/WEB-INF/view/home/footer.jsp"/> 
		</footer>
	</div>
</body>
</html>