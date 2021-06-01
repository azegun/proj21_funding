<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/proj21_funding/home_css/main.css">

</head>
<body>
	<div class="container">
		<header>		   
			<jsp:include page="/WEB-INF/view/home/header.jsp"/>
		</header>
		<%-- ${projects } --%>
		<section>
			<c:forEach var="prj" items="${projects }">
			<tr>
			<td><img src = "<%=request.getContextPath() %>/images/${prj.prjNo }.jpg"></td>
			<td>${prj.prjNo }</td>
			<td>${prj.prjName }</td>
			
			
			</c:forEach>
		</section>
		
	</div>
</body>
</html>