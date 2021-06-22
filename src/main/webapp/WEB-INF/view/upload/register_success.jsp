<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
					/* 프로젝트 삭제 */		
							$(function(){
								var contextPath = "<%=request.getContextPath()%>";
								$("#delete_list").on("click", function(){
									window.location.href = contextPath+"/removeOneProject/${pro.prjNo}";
								});			
							});
					</script>
</head>
<body>
${pro}
${uploadfile }
${Uploadfile }


<%-- ${pro } --%>
<%-- ${category[0] } --%>
<%=request.getContextPath() %>/images/project/
<section class="container">
		<header>		   
				<jsp:include page="/WEB-INF/view/home/header.jsp"/>
		</header>
		<c:if test="${pro == null}">
				<h2>등록된 프로젝트이 존재하지 않습니다.</h2>
				<div id ="foot_btn">		
				<button id = "go_list">리스트</button>
				</div>	
		</c:if>
		<c:if test = "${pro != null}">
		<h2>프로젝트 등록</h2>
		<section id= "table_all">
			<div id ="foot_btn">	
					
			</div>	
		<table border=1>		
				<tbody>
					<tr class = "col1">
										<td class="td_left"><label for="prjNo">프로젝트번호</label></td>
										<td class="td_right" ><span id="prjNo">${pro.prjNo }</span></td>
					</tr>
					<tr class = "col2">
										<td class="td_left"><label for="pCategoryName">카테고리</label></td>
										<td class="td_right" ><span id="pCategoryName">${category[0].pCategoryName }</span></td>	
					</tr>
					<tr class = "col3">
										<td class="td_left"><label for="prjName">프로젝트</label></td>
										<td class="td_right" ><span id="prjName">${pro.prjName}</span></td>
					</tr>
					<tr class = "col4">
										<td class="td_left"><label for="prjContent">프로젝트 소개</label></td>							
										<td class="td_right" >
												<div class ="sboption">${pro.prjContent }</div>
										</td>							
					</tr>	
					<tr class = "col5">
										<td class="td_left"><label for="prjGoal">목표금액</label></td>
										<td class="td_right" >
												<span id="prjGoal">
														<fmt:formatNumber value="${pro.prjGoal}" pattern="\\#,###"/>
												 </span>
										 </td>										
					</tr>			
					<tr class = "col6">
										<td class="td_left"><label for="endDate">마감일</label></td>
										<td class="td_right" ><span id="endDate">${pro.endDate }</span></td>
					</tr>	
					<tr class = "col7">
										<td class="td_left"><label for="payDate">결제일</label></td>
										<td class="td_right" ><span id="payDate">${pro.payDate}</span></td>
					</tr>
					<tr class = "col8">
										<td class="td_left"><label for="optName">옵션이름</label></td>
										<td class="td_right" ><span id="optName">${propt.optName }</span></td>
					</tr>
					<tr class = "col9">
										<td class="td_left"><label for="optPrice">옵션금액</label></td>
										<td class="td_right" >
												<span id="optPrice">													
														<fmt:formatNumber value="${propt.optPrice}" pattern="\\#,###"/>
												</span>
										</td>
					</tr>
					<tr class = "col10">
										<td class="td_left"><label for="optContent">옵션내용</label></td>
										<td class="td_right" ><div class ="sboption">${propt.optContent}</div></td>
					</tr>
					
				</tbody>
		</table>
		</section>
				<div id ="foot_btn">					
						<button id= "update_list">수정</button>
						<button id = "go_list">리스트</button>
						<button id= "delete_list">삭제</button>
				</div>
				</c:if>
		<footer>
			<jsp:include page="/WEB-INF/view/home/footer.jsp"/>
		</footer>
	</section>


</body>
</html>