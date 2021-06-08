<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>upload register</title>	
		<link rel="stylesheet" href=" <%=request.getContextPath() %>/css/home_css/main.css">
		<link rel="stylesheet" href=" <%=request.getContextPath() %>/css/upload_css/register.css">
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script type="text/javascript">
		$(document).ready(function(){	
			$('ul.tabs li').click(function(){
				var tab_id = $(this).attr('data-tab');

			$('ul.tabs li').removeClass('current');
			$('.register_mid').removeClass('current');

			$(this).addClass('current');
			$("#"+tab_id).addClass('current');
	});
});
</script>		
</head>
<body>
		<section class="container">
		<form action= "<%=request.getContextPath() %>/ListSuccess" method="post">
		<header>		   
				<jsp:include page="/WEB-INF/view/home/header.jsp"/>
		</header>
		<section id = "register_mid">
			<div class="container_tab">
					<ul class="tabs">
							<li class="tab-link current" data-tab="tab-1">프로젝트 정보</li>
							<li class="tab-link" data-tab="tab-2">옵션</li>
					</ul>		
					<div id="tab-1" class="register_mid current">
							<jsp:include page="/WEB-INF/view/upload/register_prjinfo.jsp"/>
					</div>
					<div id="tab-2" class="register_mid">
							<jsp:include page="/WEB-INF/view/upload/register_optinfo.jsp"/>		
					</div>	
			</div>		
			<div id="register_btns">
					<input type="submit" value="등록"/>&nbsp;&nbsp; 
					<input type="reset" value="다시쓰기" />&nbsp;&nbsp; 
					<button id = "go_info" >취소</button>					
			</div>	
		</section>
		<footer>
			<jsp:include page="/WEB-INF/view/home/footer.jsp"/>
		</footer>
		</form>			
		</section>

</body>
</html>