<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/home_css/main.css">
</head>
<body>
	<div class="container">
		<header>
			<jsp:include page="/WEB-INF/view/home/header_top.jsp" />
		</header>
		<section id="searchPwFormArea">
			<fieldset id="searchId">				
				이메일로 임시 비밀번호가 발급되었습니다.						
			</fieldset>
			<a href ="<c:url value='/login'/>" ><button type="button">로그인화면으로 가기</button></a>
		</section>		
		<footer>
			<jsp:include page="/WEB-INF/view/home/footer.jsp" />
		</footer>
	</div>
</body>
</html>