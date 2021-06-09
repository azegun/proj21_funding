<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디/비밀번호 찾기</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/home_css/header.css">
</head>
<body>
	<div class="container">
		<header>		   
			<jsp:include page="/WEB-INF/view/home/header_top.jsp"/> 
		</header>	
		<fieldset id="searchnot">			
				<section id="searchnotFormArea">
					회원계정을 찾을 수 없습니다.
				</section>						
				<p><a href="<c:url value='/main'/>">메인화면으로가기</a></p>
				<p><a href="<c:url value='/account/signUp1'/>">회원가입하기</a></p>				
		</fieldset>
		<footer>
			<jsp:include page="/WEB-INF/view/home/footer.jsp"/> 
		</footer>
	</div>
</body>
</html>