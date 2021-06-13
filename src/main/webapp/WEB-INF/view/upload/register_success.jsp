<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   	<c:set var="propt" value="${prjOption}"/> 
				<c:set var="pro" value="${project}"/>		
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>업로드 완료</title>
			<link rel="stylesheet" href=" <%=request.getContextPath() %>/css/upload_css/regiser_success.css">
			<link rel="stylesheet" href=" <%=request.getContextPath() %>/css/home_css/main.css">
				<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
					<script type="text/javascript">
					/* 전체 리스트로 */
							$(function(){
								var contextPath = "<%=request.getContextPath()%>";
								$("#go_list").on("click", function(){
									window.location.href = contextPath+"/projectListAll";
								});			
							});
					/* 프로젝트 리스트 수정으로 */		
							$(function(){
								var contextPath = "<%=request.getContextPath()%>";
								$("#update_list").on("click", function(){
									window.location.href = contextPath+"/updatePrj/${pro.prjNo}";
								});			
							});
					</script>
</head>
<body>
${pro.prjNo}
<section class="container">
		<header>		   
				<jsp:include page="/WEB-INF/view/home/header.jsp"/>
		</header>
		<section id= "table_all">
		<table>		
			<thead id = "column">
				<tr>
				<td>
				</td>
						<th>프로젝트 명</th>	<th>프로젝트 내용</th>
						<th>목표 금액</th>
						<th>마감일</th>	<th>결제일</th>
						<th>옵션이름</th><th>옵션금액</th>
						<th>옵션내용</th>
						<th>프로젝트수정</th><th>삭제</th>
				</tr>
			</thead>
			<tbody id= "context">
					
				<tr> 
				<td>
				</td>									
							<td>${pro.prjName}</td>
							<td>${pro.prjContent }</td>
							<td>${pro.prjGoal}</td>
							<td>${pro.endDate }</td>
							<td>${pro.payDate }</td>
							<td>${propt.optName }</td>
							<td>${propt.optPrice }</td>
							<td>${propt.optContent }</td>	
							<td><button id= "update_list">프로젝트 수정</button></td>
							<td><button id= "delete_list">삭제</button></td>
				</tr>
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