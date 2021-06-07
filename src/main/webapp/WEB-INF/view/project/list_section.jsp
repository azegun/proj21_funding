<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/project_list_css/list_section.css">
</head>
<body>
	<c:forEach var="prj" items="${projects }">
	<div class="project">
		<img src = "<%=request.getContextPath() %>/images/project/project${prj.prjNo }.jpg"/>
		<p>${prj.prjName }</p>
	</div>
	</c:forEach>
</body>
</html>