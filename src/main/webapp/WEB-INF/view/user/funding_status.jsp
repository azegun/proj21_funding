<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>100펀딩-후원현황</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/home_css/main.css">
</head>
<body>
<%-- ${fundingList }
후원현황 --%>
<div class="container">
		<header>		   
			<jsp:include page="/WEB-INF/view/home/header.jsp"/>
		</header>
		<section>
		<table border=1px>
			<tr>
				<th> </th><th>프로젝트명</th><th>옵션명</th><th>옵션내용</th><th>가격</th><th>시작일</th>
				<th>마감일</th><th>결제일</th><th>마감여부</th><th>결제여부</th>
			</tr>
			<c:forEach var="funding" items="${fundingList }">
			<tr>
				<td><img src="<%=request.getContextPath()%>/images/project/project${funding.prjNo.prjNo }.jpg"/>
				<td>${funding.prjNo.prjName }</td>
				<td>${funding.optNo.optName }</td>
				<td>${funding.optNo.optContent}</td>
				<td>${funding.optNo.optPrice}</td>
				<td>${funding.prjNo.startDate}</td>
				<td>${funding.prjNo.endDate}</td>
				<td>${funding.prjNo.payDate}</td>
				<c:choose>
					<c:when test="${funding.payYn eq true}">
						<td>결제완료</td>
					</c:when>
					<c:otherwise>
						<td>미결제</td>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${funding.endYn eq true}">
						<td>마감 완료</td>
					</c:when>
					<c:otherwise>
						<td>진행중</td>
					</c:otherwise>
				</c:choose>
			</tr>
			</c:forEach>
		</table>
		</section>
		<footer>
			<jsp:include page="/WEB-INF/view/home/footer.jsp"/>
		</footer>
</div>
</body>
</html>