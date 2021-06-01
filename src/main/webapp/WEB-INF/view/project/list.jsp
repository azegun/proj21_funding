<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%=request.getContextPath() %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<<<<<<< HEAD
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/home_css/main.css">
=======
<title>100펀딩 - 크리에이터를 위한 크라우드펀딩</title>
<link rel="stylesheet" href="/proj21_funding/home_css/main.css">
>>>>>>> branch 'master' of https://github.com/DaeguIT-MinSuKim/proj21_funding.git

</head>
<body>
	<div class="container">
		<header>		   
			<jsp:include page="/WEB-INF/view/home/header.jsp"/>
		</header>
		<%-- ${projects } --%>
		<section>
			<jsp:include page="/WEB-INF/view/project/list_section.jsp"/>
		<%-- 	<c:forEach var="prj" items="${projects }">
			
			<img src = "<%=request.getContextPath() %>/images/project/project${prj.prjNo }.jpg"><br>
			${prj.prjName }
			
			</c:forEach> --%>
		</section>
		
	</div>
</body>
</html>