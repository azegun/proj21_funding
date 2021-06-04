<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<header>		   
				<jsp:include page="/WEB-INF/view/home/header.jsp"/>
		</header>
		<section id = "register_mid">
			<div class="container_tab">
					<ul class="tabs">
						<li class="tab-link current" data-tab="tab-1">프로젝트 개요</li>
						<li class="tab-link" data-tab="tab-2">프로젝트 스토리</li>
					</ul>		
			<div id="tab-1" class="register_mid current">
				<jsp:include page="/WEB-INF/view/upload/register_mid.jsp"/>		
			</div>
	<div id="tab-2" class="register_mid">
				<jsp:include page="/WEB-INF/view/upload/register_secpage.jsp"/>		
	</div>

</div>
			
		</section>
		<footer>
			<jsp:include page="/WEB-INF/view/home/footer.jsp"/>
		</footer>
		</section>

</body>
</html>