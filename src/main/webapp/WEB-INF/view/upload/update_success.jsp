<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
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
									window.location.href = contextPath+"/myUploadedlist/${authInfo.userNo }";
								});			
							});
					</script>
</head>
<body>
	
		${project }
<%-- ${project } --%>
<section class="container">
		<header>		   
				<jsp:include page="/WEB-INF/view/home/header.jsp"/>
		</header>
		<h2>프로젝트 등록하였습니다.</h2>
		<section id= "table_all">
			<table border = 1>
						<tbody>
								<tr class = "col1">
										<td class="td_left"><label for="userName">작성자</label></td>
										<td class="td_right" ><span id="userName">${authInfo.userName }</span></td>
								</tr>
								<tr class = "col2">
										<td class="td_left"><label for="pCategoryNo">카테고리</label></td>
										<td class="td_right" >
												<span id="pCategoryNo">												
												${category[0].pCategoryName }
												</span>
										</td>
								</tr>
								<tr class = "col3">
										<td class="td_left"><label for="prjName">프로젝트</label></td>
										<td class="td_right" ><span id="prjName">${project.pName }</span></td>
								</tr>
								<tr class = "col4">
										<td class="td_left"><label for="prjContent">프로젝트 소개</label></td>
										<td class="td_right" >
												<div class ="sboption">${project.pContent }</div>
										</td>
								</tr>								
								<tr class = "col5">
										<td class="td_left"><label for="prjGoal">목표금액</label></td>
										<td class="td_right" >
												<span id="prjGoal">
														<fmt:formatNumber value="${project.pGoal }" pattern="\\#,###"/>
												 </span>
										 </td>										
								</tr>								
								<tr class = "col6">
										<td class="td_left"><label for="endDate">마감일</label></td>
										<td class="td_right" ><span id="endDate">${project.eDate}</span></td>
								</tr>
								<tr class = "col7">
										<td class="td_left"><label for="payDate">결제일</label></td>
										<td class="td_right" ><span id="payDate">${project.pDate}</span></td>
								</tr>
								
								<tr class = "col8">
										<td class="td_left"><label for="optName">옵션이름</label></td>
										<td class="td_right" ><span id="optName">${project.oName}</span></td>
								</tr>
								<tr class = "col9">
										<td class="td_left"><label for="optPrice">옵션금액</label></td>
										<td class="td_right" >
												<span id="optPrice">													
														<fmt:formatNumber value="${project.oPrice}" pattern="\\#,###"/>
												</span>
										</td>
								</tr>
								<tr class = "col10">
										<td class="td_left"><label for="optContent">옵션내용</label></td>
										<td class="td_right" ><div class ="sb2option">${project.oContent}</div></td>
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