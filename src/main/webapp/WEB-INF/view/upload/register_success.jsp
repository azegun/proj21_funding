<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업로드 완료</title>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
			<script type="text/javascript">
		$(function(){
			var contextPath = "<%=request.getContextPath()%>";
			$("#go_list").on("click", function(){
				window.location.href = contextPath+"/projectListAll";
			});			
		});
		</script>
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
		<button id = "go_list">리스트</button>
		<a href="<%=request.getContextPath()%>/project/list"></a>
	


</body>
</html>