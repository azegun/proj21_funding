<%@page import="proj21_funding.service.impl.PrjOptionServiceImpl"%>
<%@page import="proj21_funding.service.PrjOptionService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%-- <%
	PrjOptionService service;
	service = new PrjOptionServiceImpl();
%>
<c:set var="prjDetail" value="<%=service %>"/> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/project_list_css/list_section2.css">
</head>
<body>
	<ul>
		<c:forEach var="prj" items="${projects }">
			<li>
				<div class="border">
					<div class="prj">
						<div class="prjThumb">
							<img src = "<%=request.getContextPath() %>/images/project/project${prj.prjNo }.jpg"/>
						</div>
						<div class="prjName">
							<a href="<c:url value='/prjDetail/${prj.prjNo }'/>">${prj.prjName }</a>				
						</div>
					</div>
				</div>
				
			</li>
		</c:forEach>
	</ul>
</body>
</html>