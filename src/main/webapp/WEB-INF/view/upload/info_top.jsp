<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"	 %>
   
<!DOCTYPE html>
<html>
<head>
			<meta charset="UTF-8">
			<title>Info Top</title>
			<link rel="stylesheet" href=" <%=request.getContextPath() %>/css/upload_css/info_top.css">
			<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
			<script type="text/javascript">
			/* 프로젝트 등록 */
			$(function(){
			var contextPath = "<%=request.getContextPath()%>";
			$("#register_proj").on("click", function(){
				
				var num =	${list.bankAccount}
				console.log(num)
			 	if(num != null){
			 		window.location.href = contextPath+"/registerForm";					
				}else{				
					alert("계좌등록 후 사용할 수 있습니다.")
					window.location.href = contextPath+"/registerAccount";
				} 				
			});			
			
			/*로그인 페이지로  */
			var contextPath = "<%=request.getContextPath()%>";
			$("#login").on("click", function(){
				alert("로그인 후 사용하실 수 있습니다.")
				window.location.href = contextPath+"/login";
			});			
		});
		</script>
</head>
<body>
${list.bankAccount}
			 <!-- 프로모션 배너 -->
			<img src=" <%=request.getContextPath() %>/images/home2.jpg" id="top_img">
			<div id = "top_context">					
					<h3>마음 속 프로젝트 아이디어, 100펀딩에서 현실로.</h3>
					<p>
					 크라우드펀딩으로 프로젝트를 위한 자금도 모으고, 든든한 후원자 네트워크도 확보할 수 있습니다.
					</p>
			</div>
			<div id = "top_btns">
			<c:choose>
					<c:when test="${empty authInfo }">
							<button id = "login">프로젝트 등록하기</button>
							<button id = "guide_proj">창작자 가이드</button>
					</c:when>
					<c:otherwise>
							 <button id = "register_proj">프로젝트 등록하기</button>
							 <button id = "guide_proj">창작자 가이드</button>
					</c:otherwise>
			
			</c:choose>
					
		
			 </div>		
</body>
</html>