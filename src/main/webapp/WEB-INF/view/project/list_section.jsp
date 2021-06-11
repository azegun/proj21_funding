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
${prjs}
<%-- ${projects } --%>
	<ul>
		<c:forEach var="prj" items="${prjs }">
			<li>
				<div class="border">
					<div class="prj">
						<div class="prjThumb">
							<img src = "<%=request.getContextPath() %>/images/project/project${prj.prjNo }.jpg"/>
						</div>
						<div class="prjName">
							<a href="<c:url value='/prjDetail/${prj.prjNo }'/>">${prj.prjName }</a><span>제작자 : ${prj.prjManager }</span><br>
							<span>총 후원자 수 : ${prj.totalCount }</span><br>
								
							<span>후원금액 : ${prj.totalPrice } </span><br>
							<progress value="${prj.totalPrice }" max = "${prj.prjGoal }"></progress> <span>달성률 :  ${prj.totalPrice/prj.prjGoal*100 }%</span>
						</div>
					</div>
				</div>
				
			</li>
		</c:forEach>
	</ul>
</body>
</html>