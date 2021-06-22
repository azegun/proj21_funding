<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>수정</title>
				<link rel="stylesheet" href=" <%=request.getContextPath() %>/css/home_css/main.css">
				<link rel="stylesheet" href=" <%=request.getContextPath() %>/css/upload_css/update.css">
				<link rel="stylesheet" href=" <%=request.getContextPath() %>/css/upload_css/update_prjlist.css">
				<link rel="stylesheet" href=" <%=request.getContextPath() %>/css/upload_css/update_opjlist.css">
				<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
				<!--datepicker  -->
				  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
				  <link rel="stylesheet" href="/resources/demos/style.css">
				  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
				  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
				<script type="text/javascript">
				<!--datepicker  -->
	$(document).ready(function(){	
			$('ul.tabs li').click(function(){
				var tab_id = $(this).attr('data-tab');

			$('ul.tabs li').removeClass('current');
			$('.register_mid').removeClass('current');

			$(this).addClass('current');
			$("#"+tab_id).addClass('current');
		}); 
	});
			//goback()
			$(function(){
				var contextPath = "<%=request.getContextPath()%>";
				$("#return").on("click", function(){
					/* window.location.href = contextPath+"/updateListCancel"; */
				});			
			});
			//datepicker
			$(function(){
				$(".datepicker").datepicker({
					dateFormat: 'yy-mm-dd',
					minDate: 0
				});
			});
			
	</script>		
</head>
<body>	
<section class="container">		
		<header>		   
				<jsp:include page="/WEB-INF/view/home/header.jsp"/>
		</header>
		<form  action= "<%=request.getContextPath() %>/updateListSuccess" method="post" enctype="multipart/form-data">
		<section id = "register_center">
		<!--탭 부분  -->
			<div class="container_tab">
					<ul class="tabs">
							<li class="tab-link current"  id = "tab-click" data-tab="tab-1">프로젝트 정보</li>
							<li class="tab-link"   id = "tab-click2" data-tab="tab-2">옵션</li>
					</ul>	
		<!--탭 부분  -->			
		
		<!--탭1 프로젝트부분  -->			
					<div id="tab-1" class="register_mid current">
					<h2>프로젝트 수정</h2>	
		<section id = "upload_prjcontent">					
			<table>			
				<tbody>									
			<tr>
					<td class = "td_left">
							<label for = "prjNo">프로젝트 번호</label>
					</td>
					<td class = "td_right" >
							<input type="text" id = "prjNo" name = "prjNo" value="${prjNo }" size = 40 required="required" readonly="readonly" />
					</td>
			</tr>
			<tr>
				<td class = "td_left">
							<label for = "userName" >작성자</label>
					</td>
					<td class = "td_right">
							  <input type="text" id = "userName" name = "userName"  value ="${ project[0].prjNo.userNo.userName} "  size = 40   required="required"/> 
					</td>
					<td class = "td_right">
							  <input type="hidden" id = "userNo" name = "userNo.userNo"  value ="${authInfo.userNo }"  size = 40   required="required"  readonly="readonly"/> 
					</td>
			</tr>
			<tr>
					<td class="td_left"><label for="pCategoryNo">카테고리</label></td>
					<td class="td_right">
					<!-- 반복으로 같은거 찾는 조건  -->
						<select id="pCategoryNo" name="pCategoryNo.pCategoryNo"  >		
									<option value = "0">---선택해주세요---- </option>
							<c:forEach var = "c"  items="${category }" >
									<c:choose>									
									<c:when test="${c.pCategoryNo eq project[0].prjNo.pCategoryNo.pCategoryNo }" >
											<option  value = " ${c.pCategoryNo }" selected>${c.pCategoryName }</option>
									</c:when>
									<c:otherwise>
											<option  value = " ${c.pCategoryNo }" >${c.pCategoryName }</option>
									</c:otherwise>
									</c:choose>
							</c:forEach>									
						</select>
					</td>
			</tr>
			<tr>
					<td class = "td_left">
							<label for = "prjName">프로젝트 명</label>
					</td>
					<td class = "td_right"	>
							  <input type="text" id = "prjName" name = "prjName" size = 40  value = "${project[0].prjNo.prjName}"  required="required"/>
					</td>
			</tr>
			<tr>
					<td class = "td_left">
							<label for = "prjContent">프로젝트 소개</label>
					</td>
					<td class = "td_right">
							 <textarea id = "prjContent" name = "prjContent"   rows="15" cols="42" required="required"> ${project[0].prjNo.prjContent}</textarea>
					</td>
			</tr>
			<tr>
					<td class = "td_left">
							<label for = "prjGoal">목표금액</label>
					</td>
					<td class = "td_right">
							 <input type="text" id = "prjGoal" name = "prjGoal" value =  "${project[0].prjNo.prjGoal}" size = 40 required="required"></input>
					</td>
			</tr>
			<tr>
					<td class = "td_left">
							<label for = "uploadFile">프로젝트 파일첨부</label>
					</td>
					<td class = "td_right">
							<input type="file" name = "uploadfile" placeholder="파일 선택">
					</td>
			</tr> 
			<tr>
					<td class = "td_left">
							<label for = "endDate">마감일</label>
					</td>
					<td class = "td_right">
							<input type="text" class="datepicker" name = "endDate"  value = "${project[0].prjNo.endDate}" required="required">
					</td>
			</tr>
			<tr>
					<td class = "td_left">
							<label for = "payDate">결제일</label>
					</td>
					<td class = "td_right">
							<input type="text" class="datepicker" name = "payDate" value = "${project[0].prjNo.payDate}" required="required">
					</td>
			</tr>			
				</tbody>	
			</table>					
		</section>		
			</div>
		<!--탭1 프로젝트부분  -->		
		
		<!--탭2 옵션부분  -->				
				<div id="tab-2" class="register_mid">
						<h2>옵션 수정</h2>	
			<section id = "upload_opjcontent">					
				<table>			
					<tbody>			
				<!-- <div id = "option1">	 -->								
							<tr>											
									<td class = "td_left">
											<label for = "optName">옵션이름</label>
									</td>									
									<td class = "td_right">
											 <input type="text" id = "optName" name = "optName" value = "${ project[0].optName }" size = 40 required="required"></input>
									</td>
								<td class = "td_right">
											 <input type="hidden" id = "optNo" name = "optNo" value= "${ project[0].optNo }" ></input>
									</td>
							</tr>
							<tr>
									<td class = "td_left">
											<label for = "optPrice">옵션금액</label>
									</td>
									<td class = "td_right">
											 <input type="text" id = "optPrice" name = "optPrice" value = "${ project[0].optPrice }"  size = 40 required="required"></input>
									</td>
							</tr>
							<tr>
									<td class = "td_left">
											<label for = "optContent">옵션내용</label>
									</td>
									<td class = "td_right">
											 <textarea id = "optContent" name = "optContent"	rows="11" cols="42" required="required">${ project[0].optContent }</textarea>
									</td>
							</tr>
						<!-- 	</div>
							<div id = "addOption"> -->
									<!--  <span id = "optionPlus">+</span>
									<span id = "optionMinus">-</span> -->
							<!-- </div> -->
							<!--  월요일에 열기-->
						<!-- 	<div id = "option2">
								<tr>
									<td class = "td_left">
											<label for = "addOptName">옵션이름</label>
									</td>
									<td class = "td_right">
											 <input type="text" id = "addOptName" name = "addOptName"  size = 40 ></input>
									</td>
							</tr>
							<tr>
									<td class = "td_left">
											<label for = "addOptPrice">옵션금액</label>
									</td>
									<td class = "td_right">
											 <input type="text" id = "addOptPrice" name = "addOptPrice"  size = 40 ></input>
									</td>
							</tr>
							<tr>
									<td class = "td_left">
											<label for = "addOptContent">옵션내용</label>
									</td>						
									<td class = "td_right">
											 <textarea id = "addOptContent" name = "addOptContent"	rows="11" cols="42" ></textarea>
									</td>
							</tr>			 -->
					</tbody>	
				</table>					
			</section>			
				</div>	
		<!--탭2 옵션부분  -->	
		
			</div>		
			<div id="update_btns">
					<input type="submit" name ="tkdrjs7" value="등록"/>&nbsp;
					<input type="reset" value="다시쓰기" />&nbsp; 
					<button id = "return">뒤로</button>
			</div>	
		</section>
		</form>		
		<footer>
			<jsp:include page="/WEB-INF/view/home/footer.jsp"/>
		</footer>		
		</section>

</body>
</html>