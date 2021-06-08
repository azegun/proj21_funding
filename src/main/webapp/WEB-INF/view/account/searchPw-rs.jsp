<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		${userSearch.userId}		
		<fieldset id="searchPw">			
				<section id="searchPwFormArea">
					<form:form modelAttribute="userSearch">
					<form:errors />
					<fieldset id="searchBtn">	
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
						</fieldset>
					</form:form>
				</section>			
		</fieldset>
		<footer>
			<jsp:include page="/WEB-INF/view/home/footer.jsp"/> 
		</footer>
	</div>
</body>
</html>