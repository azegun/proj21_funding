<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/home_css/header.css">
</head>
<body>
	<div class="container">
		<header>		   
			<jsp:include page="/WEB-INF/view/home/header_top.jsp"/> 
		</header>
		<fieldset id="searchPw">			
			<c:if test="${null ne userSearch.userId}">
				<section id="searchPwFormArea">
					<form:form modelAttribute="userChangePw">	
						<p>
							<label>새 비밀번호:<br>
							<form:password path="newUserPw"/>
							<form:errors path="newUserPw" />
							</label>
						</p>
						<p>
							<label>비밀번호확인:<br>
							<form:password path="confirmUserPw"/>
							<form:errors path="confirmUserPw" />
							</label>
						</p>
						<input type="submit" value="변경하기">
					</form:form>
				</section>				
			</c:if>
			<c:if test="${null eq userSearch.userId}">
				<section id="searchIdFormArea">
					회원계정을 찾을 수 없습니다.
				</section>						
				<p><a href="<c:url value='/main'/>">메인화면으로가기</a></p>
				<p><a href="<c:url value='/account/signUp1'/>">회원가입하기</a></p>	
			</c:if>	
		</fieldset>
		<footer>
			<jsp:include page="/WEB-INF/view/home/footer.jsp"/> 
		</footer>
	</div>
</body>
</html>