<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>upload_success</title>
			<link rel="stylesheet" href=" <%=request.getContextPath() %>/css/upload_css/update_success.css">
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
							
							/* 메인으로 */
							$(function(){
								var contextPath = "<%=request.getContextPath()%>";
								$("#go_main").on("click", function(){
									window.location.href = contextPath+"/";
								});			
							});
							
							/* 나의 리스트로으로 */
							$(function(){
								var contextPath = "<%=request.getContextPath()%>";
								$("#go_myList").on("click", function(){
									window.location.href = contextPath+"/myUploadedlist";
								});			
							});
					</script>
</head>
<body>

<section class="container">
		<header>		   
				<jsp:include page="/WEB-INF/view/home/header.jsp"/>
		</header>
		<section id= "table_all">
		<table border= 1>		
			<thead id = "column">
				<tr>
						<th>번호</th>
						<th>프로젝트</th>	
						<th>소개</th>
						<th>목표 금액</th>
						<th>마감일</th>
						<th>결제일</th>
						<th>옵션이름</th>
						<th>옵션금액</th>
						<th>옵션내용</th>
				</tr>
			</thead>
			<tbody id= "context">			
				<tr> 
							<td>${project.pNo }</td>
							<td>${project.pName }</td>
							<td>${project.pContent }</td>
							<td>${project.pGoal}</td>
							<td>${project.eDate }</td>
							<td>${project.pDate }</td>
							<td>${project.oName }</td>
							<td>${project.oPrice }</td>
							<td>${project.oContent }</td>
				</tr>
				</tbody>
		</table>
		</section>
				<div id ="foot_btn">
						<button id = "go_list">최근 프로젝트</button>&nbsp;
						<button id = "go_main">메인</button>&nbsp;
						<button id = "go_myList">내 프로젝트</button>						
				</div>
		<footer>
			<jsp:include page="/WEB-INF/view/home/footer.jsp"/>
		</footer>
	</section>


</body>
</html>