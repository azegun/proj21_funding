<%@page import="proj21_funding.service.PrjOptionService"%>
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
${count }

	<div class="container">
		<header>		   
			<jsp:include page="/WEB-INF/view/home/header.jsp"/>
		</header>
		
		<span>
		<img src = "<%=request.getContextPath() %>/images/project/project${prj[0].prjNo.prjNo }.jpg"/>
		</span>
		<div class="content">
		<h1>${prj[0].prjNo.prjName }</h1>
		<span>총 후원자 수 : ${count }명</span><br>
		<span>목표 금액: ${prj[0].prjNo.prjGoal }원</span><br>
		<span>총 후원 금액 : ${sum}원</span>
		<span>제작자 : ${prj[0].prjNo.userNo.userName }</span>
		<progress value="${sum }" max = "${prj[0].prjNo.prjGoal }"></progress> <span>달성률 :  ${sum/prj[0].prjNo.prjGoal*100 }%</span>
		<c:forEach var="prj" items="${prj }" varStatus="count">
				<fieldset class="optBox">
					<ul>
						<li> ${prj.optContent } : <span class="price"><c:out value="${prj.optPrice }원" /></span></li>
					</ul>
				</fieldset>
		</c:forEach>
		<span>가격 : 0원 </span>
		
	
		
		</div>
	</div>
</body>
</html>