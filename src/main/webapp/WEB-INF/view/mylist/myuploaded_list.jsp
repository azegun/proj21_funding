<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>등록된 리스트</title>
			<link rel="stylesheet" href=" <%=request.getContextPath() %>/css/home_css/main.css">
						<link rel="stylesheet" href=" <%=request.getContextPath() %>/css/mylist.css/myuploaded_list.css">			
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		
		<script type="text/javascript">
				
		
	function checkAll(theForm){
		if(theForm.remove.length == undefined){
			theForm.remove.checked = theForm.allCheck.checked;
		}else{
			for(var i =0; i <theForm.remove.length; i++){
				theForm.remove[i].checked = theForm.allCheck.checked;
			}
		}
	}	
	
	$(function(){
		var contextPath = "<%=request.getContextPath()%>";
		$("#go_main").on("click", function(){
			window.location.href = contextPath+"/";
		});			
	});
		
</script>
</head>
<body>
<%-- ${myList } --%>

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
						<!-- <th>소개</th> -->
						<th>목표 금액</th>
						<th>달성률</th>
						<th>시작일</th>
						<th>마감일</th>
						<th>결제일</th>
						<!-- <th>옵션이름</th>
						<th>옵션금액</th>
						<th>옵션내용</th> -->
						<th>진행상황</th>
				</tr>
			</thead>
			<tbody id= "context">
				<c:forEach var = "list" items = "${myList}" varStatus="status">	
				<tr class = "size"> 
							<td>${status.index+1 } </td>
							<td><a href = "<%=request.getContextPath() %>/selectDetailList/${list.prjNo.prjNo }" >${list.prjNo.prjName }</a></td>
							<td id = "prjGoal"><fmt:formatNumber value="${list.prjNo.prjGoal }" pattern="\\#,###"/> </td>	
							<td>${list.prjNo.totalPrice/list.prjNo.prjGoal*100}%</td>
							 <jsp:useBean id="now" class = "java.util.Date"></jsp:useBean>
							 <fmt:formatDate  var="today"  value="${now}" pattern="yyyy-MM-dd"/>  
							<td>${list.prjNo.startDate }</td>
							<td>${list.prjNo.endDate }</td>
							<td>${list.prjNo.payDate } </td>
							<td>
								
							<c:choose>
										<c:when test="${ list.prjNo.endDate < today  }">
											<span>진행완료</span><br>
										</c:when>
										<c:when test="${list.prjNo.endDate >= today }">									
											<span>진행중</span><br>
										</c:when>										
							</c:choose>	
							<c:if test = "${list.prjNo.totalPrice >= list.prjNo.prjGoal}">
											<span>목표금액달성</span>
							</c:if>
							<c:if test = "${list.prjNo.totalPrice< list.prjNo.prjGoal}">
											<span></span>
							</c:if>		
				</tr>
				</c:forEach>
				</tbody>
		</table>
		</section>
				<div id ="foot_btn">
						<button id= "select_list">프로젝트 보기</button>
						<button id = "go_main">메인</button>&nbsp;						
				</div>
		<footer>
			<jsp:include page="/WEB-INF/view/home/footer.jsp"/>
		</footer>
	</section>
<%-- 
<c:if test= "${list.prjNo.payDate > today }">
											<span>결제진행중</span>
									</c:if>
									<c:if test= "${list.prjNo.payDate < today }">
										<span>결제완료</span>
									</c:if> --%>
</body>
</html>