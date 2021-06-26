<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  
     <jsp:useBean id="now" class = "java.util.Date"></jsp:useBean>
					<fmt:formatDate  var="today"  value="${now}" pattern="yyyy-MM-dd"/>
					<c:set var = "project" value="${prjList}"/>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>upload register</title>	
		
		<!--CSS  -->
		<link rel="stylesheet" href=" <%=request.getContextPath() %>/css/home_css/main.css">
		<link rel="stylesheet" href=" <%=request.getContextPath() %>/css/upload_css/register.css">
		<!--CSS  -->
		
			<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		
		<!--datepicker 소스api  -->
		  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		  <link rel="stylesheet" href="/resources/demos/style.css">
		  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  		<!--datepicker 소스api  -->
  		
		<script type="text/javascript">	
		/*탭   */
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
	            window.location.href = contextPath+"/uploadListCancel";
	         });         
	      });
	      
	      //datepicker
			$(function(){
				$(".datepicker").datepicker({
					dateFormat: 'yy-mm-dd',
					minDate: 0
				});
			});
	      
		//진행해야함.
	      $(function(){
	         var contextPath = "<%=request.getContextPath()%>";
	         $(".test").on("click", function(){
	               var test = $('#pCategoryNo').val()
	               if(test == 0){
	            	   console.log("확인")
	                  alert("카테고리를 	선택해주세요")
	                 /*   window.location.href = contextPath+"/emptyCategory"; */
	           		   history.back() 
	               }
	         });         
	      });   
		function addopt(i){
			var sCont = "";	
			sCont += "<tbody class = 'addAll'>";
			sCont += "<tr>";
			sCont += "<td class = 'td_left'><label for = 'addOptName'>옵션이름</label></td>";
			sCont += "<td class = 'td_right'> <input type='text' id = 'addOptName' class = 'addtext' name = 'addOptName"+ i +"'  required   size = 17/></td>";
			sCont += "</tr>";
			sCont += "	<tr>";
			sCont += "	<td class = 'td_left'><label for = 'addOptPrice'>옵션금액</label></td>";
			sCont += "	<td class = 'td_right'><input type='text' id = 'addOptPrice'   class = 'addtext' name = 'addOptPrice"+ i +"'   required  size = 17 /></td>";
			sCont += "</tr>";
			sCont += "	<tr>";
			sCont += "	<td class = 'td_left'><label for = 'addOptContent'>옵션내용</label></td>	";
			sCont += "	<td class = 'td_right'> <textarea id = 'textContent'  class = 'addtext' name = 'addOptContent"+ i +"'+  required 	rows='8' cols='38' ></textarea></td>";
			sCont += "</tr>";					
			sCont += "</tbody>";
			
			 $('.addOption:last-child').append(sCont);  
		}
		
		 //아이템 추가
	   $(function(){
		   
			var i = 0;		
			//옵션추가
			$('.optionPlus').on("click", function(){	
				i += 1
				addopt(i)				 				 
			   });
			
			//옵션삭제
			$('.optionMinus').on("click", function(){
				$('.addAll:last-child').remove();
			});	
	  
	   });

</script>		
</head>
<body>
<%-- ${optList } --%>
<%-- ${prjList} --%>
${project[0].prjNo }
		<section class="container">		
		<header>		   
				<jsp:include page="/WEB-INF/view/home/header.jsp"/>
		</header>
		<form action= "<%=request.getContextPath() %>/listSuccess" method="post" enctype="multipart/form-data">
	
		<section id = "register_mid">
		<!--탭 부분  -->
			<section class="container_tab">
					<ul class="tabs">
							<li class="tab-link current"  id = "tab-click" data-tab="tab-1">프로젝트 정보</li>
							<li class="tab-link"   id = "tab-click2" data-tab="tab-2">옵션</li>
					</ul>		
		<!--탭 부분  -->
		
		<!--탭1 프로젝트부분  -->			
			<div id="tab-1" class="register_mid current">
			<h2>프로젝트 등록</h2>
	<section id="register_prjcontent">
		<table border="1">
			<tbody>
				<tr>
					<td class= "td_right" colspan="2">
								<input type="hidden" id="userNo" name="userNo.userNo" 
								value="${authInfo.userNo }" size=15 required="required" readonly="readonly" />
					</td>
				</tr>
				<tr>
					<td class="td_left"><label for="userName">작성자</label></td>
					<td class="td_right">
							<input type="text" id="userName" 	name="userName.userName"
									value="${authInfo.userName }" size= 17	required="required" />
					</td>			
				</tr>
				<tr>
					<td class="td_left"><label for="pCategoryNo">카테고리</label></td>					
					<td class="td_right" >
						<select id="pCategoryNo" name="pCategoryNo.pCategoryNo"  >		
									<option value = "0">-------선택해주세요-----------</option>
							<c:forEach var = "c"  items="${category }" >
									<option  value = " ${c.pCategoryNo }">${c.pCategoryName }</option>										
							</c:forEach>									
						</select>
					</td>
				</tr>
				<tr>
					<td class="td_left"><label for="prjName">프로젝트 명</label></td>
					<td class="td_right">
								<input type="text" id="prjName"
										name="prjName" size=45 required />
					</td>
				</tr>
				<tr>
					<td class="td_left"><label for="prjContent">프로젝트 소개</label></td>
					<td class="td_right">
							<div class= "sboption">
									<textarea id="textContent"
											name="prjContent" rows="11" cols="38" required="required"  ></textarea>
							</div>	
					</td>
				</tr>
				<tr>
					<td class="td_left"><label for="prjGoal">목표금액</label></td>
					<td class="td_right">
								<input type="text" id="prjGoal"	name="prjGoal" size=17 required="required"/>
					</td>						
				</tr>
				<tr>
					<td class="td_left"><label for="uploadFile">프로젝트 파일첨부</label>
					</td>
					<td class="td_right">
								<input type="file" name="uploadfile"	placeholder="파일 선택">
					</td>
				</tr>
			
				<tr>
					<td class="td_right" colspan="2">
							<h4>마감 후에 결제를 할 수 있으니, 결제일은 마감일보다 늦게 선택해주세요	</h4>								
					</td>
				</tr>				
				<tr>
					<td class="td_left"><label for="endDate">마감일</label></td>
					<td class="td_right">						
							<input type="text" class="datepicker" name = "endDate" required="required" placeholder="ex)2021-06-22">
					</td>
				</tr>
				<tr>
					<td class="td_left"><label for="payDate">결제일</label></td>
					<td class="td_right">
						<input type="text" class="datepicker" name = "payDate" required="required" placeholder="ex)2021-06-23">
					</td>
			   </tr>

			</tbody>
		</table>
	</section>
		</div>
		<!--탭1 프로젝트부분  -->	
				
<!--탭2 옵션부분  -->
			<div id="tab-2" class="register_mid">
						<h2>옵션</h2>	
			<section id = "register_optcontent">
				<table>
					<tbody>
							<tr>											
									<td class = "td_left">
											<label for = "optName">옵션이름</label>
									</td>									
									<td class = "td_right">
											 <input type="text" id = "optName" name = "optName"  size = 17 required="required"></input>
									</td>
							</tr>
							<tr>
									<td class = "td_left">
											<label for = "optPrice">옵션금액</label>
									</td>
									<td class = "td_right">
											 <input type="text" id = "optPrice" name = "optPrice"  size = 17 required="required"></input>
									</td>
							</tr>
							<tr>
									<td class = "td_left">
											<label for = "optContent">옵션내용</label>
									</td>
									<td class = "td_right">
											 <textarea id = "textContent" name = "optContent"	rows="8" cols="38" required="required"></textarea>
									</td>
							</tr>
							<tr>
									<td class ="td_right" colspan="2">
											  <div id="register_btns">
											  		<button type = "button" class = "optionPlus" >옵션추가</button>
											  		<button type = "button" class = "optionMinus" >옵션삭제</button>
											  </div>
									</td>
							</tr>	
							</tbody>						
							<!-- <tbody class = "addOption">	</tbody> -->
					</table>	
					<table class = "addOption">
					</table>
			</section>
				</div>				
			<!--탭2 옵션부분  -->			
				
			</section>		
			<div id="register_btns">
					<input class = "test" type="submit" value="등록"/>&nbsp;
					<input type="reset" value="다시쓰기" />&nbsp; 
					<button type="button" id= "return">뒤로</button>
			</div>	
		</section>	
		</form>
			<footer>
			<jsp:include page="/WEB-INF/view/home/footer.jsp"/>
			</footer>
		</section>

</body>
</html>

