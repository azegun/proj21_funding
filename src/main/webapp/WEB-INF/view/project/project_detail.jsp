<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${prj[0].prjNo.prjName }</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/home_css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/project_list_css/detail.css">
</head>
<body>
${prj }

	<div class="container">
		<header>		   
			<jsp:include page="/WEB-INF/view/home/header.jsp"/>
		</header>
		
		<span>
		<img src = "<%=request.getContextPath() %>/images/project/project${prj[0].prjNo.prjNo }.jpg"/>
		</span>
		<div>
		<h1>${prj[0].prjNo.prjName }</h1>
		<span>제작자 : ${prj[0].prjNo.userNo.userName }</span>
		<c:forEach var="prj" items="${prj }">
		<h4>
		${prj.optContent } : ${prj.optPrice }
		</h4>
		</c:forEach>
	
		
		</div>
	</div>
</body>
</html>