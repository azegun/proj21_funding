<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>100펀딩 - 크리에이터를 위한 크라우드펀딩</title>
<link rel="shortcut icon" href="/proj21_funding/favicon.ico">
<link rel="icon" href="/proj21_funding/favicon.ico">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/home_css/main.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script>
	$(document).ready(function() {
		$('.slider').bxSlider({
		    slideWidth: 1500, 
	         mode: 'horizontal',// 가로 방향 수평 슬라이드
	         speed: 500,        // 이동 속도를 설정
	         pager: false,      // 현재 위치 페이징 표시 여부 설정
	         moveSlides: 1,     // 슬라이드 이동시 개수
	         auto:true,	        
	        autoHover:true
		});
	});
</script>

</head>
<body>
	<!-- 페이지마다 .container해서 main.css에 있는 css비율대로 마진이랑 맞추기 -->
	<div class="container">
		<header>		   
			<jsp:include page="/WEB-INF/view/home/header.jsp"/>
		</header>
		<section>
			<jsp:include page="/WEB-INF/view/home/main_section.jsp"/>		
		</section>
		<footer>
			<jsp:include page="/WEB-INF/view/home/footer.jsp"/>
		</footer>
	</div>
</body>
</html>

