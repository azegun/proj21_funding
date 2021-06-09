<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<table border="1">
				<tr>
						<th>프로젝트 명</th>	<th>프로젝트 내용</th>
						<th>목표 금액</th>
						<th>마감일</th>	<th>결제일</th>
						<th>옵션이름</th><th>옵션금액</th>
						<th>옵션내용</th>
				</tr>
				<tr> 
				<c:set var="pro" value="${project}"/>
				<c:set var="propt" value="${prjOption}"/>
						<td>${pro.prjName}</td>
						<td>${pro.prjContent }</td>
						<td>${pro.prjGoal}</td>
						<td>${pro.endDate }</td>
						<td>${pro.payDate }</td>
						<td>${propt.optName }</td>
						<td>${propt.optPrice }</td>
						<td>${propt.optContent }</td>	
		</table>
	


</body>
</html>