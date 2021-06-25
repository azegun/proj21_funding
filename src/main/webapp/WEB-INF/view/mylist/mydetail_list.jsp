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
		
</script>
</head>
<body>
<%-- ${myList[0]}
${myList[0].prjNo.prjNo} --%>
${uploadfile }

	<section class="container">
			<header id = "mydetail_header">		   
					<jsp:include page="/WEB-INF/view/home/header.jsp"/>
			</header>
			<h2>프로젝트</h2>
		<form  action= "<%=request.getContextPath() %>/myListUpdate/${authInfo.userNo}" method="post">
			<section id = "detaillist_content">
				<table>
						<tbody>
								<tr class = "col1">
										<td class="td_right" colspan="2" >
												<input type="hidden" id="prjNo" name="prjNo" value="${myList[0].prjNo.prjNo}" 
														size=49	readonly="readonly"/>																			
										</td>					
								</tr>
								<tr class = "col2">
										<td class="td_left"><label for="userName">작성자</label></td>
										<td class="td_right" >
												<span id="userName">${authInfo.userName}</span>																					
										</td>					
								</tr>
								<tr class = "col3">
										<td class="td_left"><label for="pCategoryNo">카테고리</label></td>
										<td class="td_right" >
												<span id="pCategoryName">${categoryList[0].pCategoryName }</span>
										</td>
								</tr>
								<tr class = "col4">
										<td class="td_left"><label for="prjName">프로젝트</label></td>
										<td class="td_right" >
											<input type="text" id="prjName" name="prjName" value="${myList[0].prjNo.prjName}" 
														size=46	required="required"/>			
										</td>
								</tr>
								<tr class = "col5">
										<td class="td_left"><label for="prjContent">프로젝트 소개</label></td>
										<td class="td_right" >
													<textarea id="textContent" name="prjContent" class="sboption"
																rows="13" cols="35"	required="required" >${myList[0].prjNo.prjContent}
													</textarea>
										</td>
								</tr>								
								<tr class = "col6">
										<td class="td_left"><label for="prjGoal">목표금액</label></td>
										<td class="td_right" >
												 <span id="prjGoal">
														<fmt:formatNumber value="${myList[0].prjNo.prjGoal}" pattern="\\#,###"/>
												 </span>
										 </td>										
								</tr>
								<tr class = "col7">
										<td class="td_left"><label for="prjTagetPercent">달성률</label></td>
										<td class="td_right" >
												<progress value="${myList[0].prjNo.totalPrice}" max = "${myList[0].prjNo.prjGoal }"></progress><br> 
													<fmt:formatNumber value="${myList[0].prjNo.totalPrice/myList[0].prjNo.prjGoal*100}" pattern = ".0" /><span>%</span>
										</td>
								</tr>
								
								<tr class = "col8">
										<td class="td_left"><label for="startDate">시작일</label></td>
										<td class="td_right" ><span id="startDate">${myList[0].prjNo.startDate}</span></td>
								</tr>
								<tr class = "col9">
										<td class="td_left"><label for="endDate">마감일</label></td>
										<td class="td_right" ><span id="endDate">${myList[0].prjNo.endDate}</span></td>
								</tr>
								<tr class = "col10">
										<td class="td_left"><label for="payDate">결제일</label></td>
										<td class="td_right" ><span id="payDate">${myList[0].prjNo.payDate}</span></td>
								</tr>
								<tr class = "col11">
										<td class="td_left"><label for="uploadfile">첨부사진</label></td>
										<td class="td_right" >
											<img id = "uploadfile" src="<%=request.getContextPath() %>/images/project/project${myList[0].prjNo.prjNo}.jpg" />
										</td>
								</tr>
								
								<tr class = "col12">
										<td class="td_left"><label for="optName">옵션이름</label></td>
										<td class="td_right" >
												<input type="text" id="optName"	name="optName"
																value="${myList[0].optName}"	 size=49 required="required" ></input>
										</td>									
								</tr>
								<tr class = "col13">
										<td class="td_left"><label for="optPrice">옵션금액</label></td>
										<td class="td_right" >
												<span id="optPrice">													
														<fmt:formatNumber value="${myList[0].optPrice}" pattern="\\#,###"/>
												</span>
										</td>
								</tr>
								<tr class = "col14">
										<td class="td_left"><label for="optContent">옵션내용</label></td>
										<td class="td_right" >
													<textarea id="textContent" name="optContent"  class="sboption"
															rows="8" cols="35"	required="required" >${myList[0].optContent}</textarea>
										</td>											
								</tr>
						</tbody>
				</table>
				</section>						
						<div id = "btns">
								<input type="submit"  value="수정"/>&nbsp;
								<button id = "back">뒤로</button>								
						</div>		
					</form>				
			<footer>
					<jsp:include page="/WEB-INF/view/home/footer.jsp"/>
			</footer>
	</section>
</body>
</html>