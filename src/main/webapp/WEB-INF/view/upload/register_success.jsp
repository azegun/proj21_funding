<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>업로드 완료</title>
			<link rel="stylesheet" href=" <%=request.getContextPath() %>/css/upload_css/regiser_success.css">
			<link rel="stylesheet" href=" <%=request.getContextPath() %>/css/home_css/main.css">
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

${project}
${prjOption}
<section class="container">
		<header>		   
				<jsp:include page="/WEB-INF/view/home/header.jsp"/>
		</header>
		<section id= "table_all">
		<table>		
			<thead id = "column">
				<tr>
				<td>
				<input type = "checkbox" id = "allCheck" name = "allCheck" onclick="checkAll(this.form)"/>
				</td>
						<th>프로젝트 명</th>	<th>프로젝트 내용</th>
						<th>목표 금액</th>
						<th>마감일</th>	<th>결제일</th>
						<th>옵션이름</th><th>옵션금액</th>
						<th>옵션내용</th>
				</tr>
			</thead>
			<tbody id= "context">
				<c:set var="propt" value="${prjOption}"/> 
				<%-- <c:set var="pro" value="${project}"/> --%>
				<c:forEach var = "pro" items = "${project }" varStatus="status">
				<tr> 
				<td>
						<input type = "checkbox" id = "remove" name = "remove"/>
				</td>
		 		<td>
						${status.index+1 } <!-- 번호값 계산 -->
				</td>
					
				
							<td>${pro.prjName}</td>
							<td>${pro.prjContent }</td>
							<td>${pro.prjGoal}</td>
							<td>${pro.endDate }</td>
							<td>${pro.payDate }</td>
							<td>${propt.optName }</td>
							<td>${propt.optPrice }</td>
							<td>${propt.optContent }</td>	
				</tr>
				</c:forEach>
				</tbody>
		</table>
		</section>
				<div id ="foot_btn">
						<button id = "go_list">리스트</button>
				</div>
		<footer>
			<jsp:include page="/WEB-INF/view/home/footer.jsp"/>
		</footer>
	</section>


</body>
</html>