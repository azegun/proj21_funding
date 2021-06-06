<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/project_list_css/detail.css">
</head>
<body>
${prj }
		<h1>${prj[0].prjNo.prjName }</h1>
		<span>제작자 : ${prj[0].prjNo.userName }</span>
				<h3>프로젝트 옵션</h3>
		<c:forEach var="prj" items="${prj }">
			<li>${prj.prjNo }
		</c:forEach>
</body>
</html>