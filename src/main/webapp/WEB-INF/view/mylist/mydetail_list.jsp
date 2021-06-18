<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href=" <%=request.getContextPath() %>/css/home_css/main.css">
	<link rel="stylesheet" href=" <%=request.getContextPath() %>/css/mylist_css/mydetail_list.css">
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
			<script type="text/javascript">			
		/* 뒤로 */
	$(function(){
		var contextPath = "<%=request.getContextPath()%>";
		$("#back").on("click", function(){
			window.location.href = contextPath+"/backMyList/${authInfo.userNo}";
		});			
	});
		
	/* 수정 */
	$(function(){
		var contextPath = "<%=request.getContextPath()%>";
		$("#list_update").on("click", function(){
			window.location.href = contextPath+"/myListUpdate/${myList[0].prjNo.prjNo}";
		});			
	});
</script>
</head>
<body>

	<section class="container">
			<header id = "mydetail_header">		   
					<jsp:include page="/WEB-INF/view/home/header.jsp"/>
			</header>
			<h2>프로젝트</h2>
			<section id = "detaillist_content">
				<table border = 1>
						<tbody>
								<tr class = "col1">
										<td class="td_left"><label for="userName">작성자</label></td>
										<td class="td_right" ><span id="userName">${authInfo.userName }</span></td>
								</tr>
								<tr class = "col2">
										<td class="td_left"><label for="pCategoryNo">카테고리</label></td>
										<td class="td_right" ><span id="pCategoryNo">${categoryList[0].pCategoryName }</span></td>
								</tr>
								<tr class = "col3">
										<td class="td_left"><label for="prjName">프로젝트</label></td>
										<td class="td_right" ><span id="prjName">${myList[0].prjNo.prjName}</span></td>
								</tr>
								<tr class = "col4">
										<td class="td_left"><label for="prjContent">프로젝트 소개</label></td>
										<td class="td_right" ><span id="prjContent">${myList[0].prjNo.prjContent}</span></td>
								</tr>								
								<tr class = "col5">
										<td class="td_left"><label for="prjGoal">목표금액</label></td>
										<td class="td_right" >
												<span id="prjGoal">
														<fmt:formatNumber value="${myList[0].prjNo.prjGoal}" pattern="\\#,###"/>
												 </span>
										 </td>										
								</tr>
								<tr class = "col6">
										<td class="td_left"><label for="prjTagetPercent">달성률</label></td>
										<td class="td_right" >
												<span id="prjTagetPercent">${myList[0].prjNo.totalPrice/myList[0].prjNo.prjGoal*100}%</span>
										</td>
								</tr>
								
								<tr class = "col7">
										<td class="td_left"><label for="startDate">시작일</label></td>
										<td class="td_right" ><span id="startDate">${myList[0].prjNo.startDate}</span></td>
								</tr>
								<tr class = "col8">
										<td class="td_left"><label for="endDate">마감일</label></td>
										<td class="td_right" ><span id="endDate">${myList[0].prjNo.endDate}</span></td>
								</tr>
								<tr class = "col9">
										<td class="td_left"><label for="payDate">결제일</label></td>
										<td class="td_right" ><span id="payDate">${myList[0].prjNo.payDate}</span></td>
								</tr>
								
								<tr class = "col10">
										<td class="td_left"><label for="optName">옵션이름</label></td>
										<td class="td_right" ><span id="optName">${myList[0].optName}</span></td>
								</tr>
								<tr class = "col11">
										<td class="td_left"><label for="optPrice">옵션금액</label></td>
										<td class="td_right" >
												<span id="optPrice">													
														<fmt:formatNumber value="${myList[0].optPrice}" pattern="\\#,###"/>
												</span>
										</td>
								</tr>
								<tr class = "col12">
										<td class="td_left"><label for="optContent">옵션내용</label></td>
										<td class="td_right" ><span id="optContent">${myList[0].optContent}</span></td>
								</tr>
						</tbody>
				</table>
				</section>
						<div id = "btns">
								<button id = "list_update">수정</button>
								<button id = "back">뒤로</button>								
						</div>					
			<footer>
					<jsp:include page="/WEB-INF/view/home/footer.jsp"/>
			</footer>
	</section>
</body>
</html>