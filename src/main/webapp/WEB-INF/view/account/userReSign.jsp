<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴하기</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/home_css/main.css">
</head>
<body>
<div class="container">
		<header>		   
			<jsp:include page="/WEB-INF/view/home/header_top.jsp"/> 
		</header>
		<section id="reSignArea">
			<h1>회원정보</h1>
			<form:form modelAttribute="userInfo">
			<form:errors />
				<p>
					<label> 비밀번호 :
					<form:password path="userPw" /> 
					<form:errors path="userPw" />
					</label>
				</p>
			<form:button id="submit" value="submit">탈퇴하기</form:button>											
			</form:form>
		</section>		
		<footer>
			<jsp:include page="/WEB-INF/view/home/footer.jsp"/> 
		</footer>		
	</div>
</body>
</html>