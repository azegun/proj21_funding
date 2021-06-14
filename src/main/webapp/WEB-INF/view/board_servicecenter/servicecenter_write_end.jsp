<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의하기 | 고객센터</title>
<link rel="stylesheet" href="/proj21_funding/css/servicecenter_write.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/home_css/main.css">
</head>
<body>
	<section class="container">
		<header>		   
			<jsp:include page="/WEB-INF/view/home/header_top.jsp"/> 
			<jsp:include page="/WEB-INF/view/home/header_account.jsp"/> 
		</header>
	<section class = "sevicecenter_write_end">
	<h2>문의하기</h2>
	
	<p>질문이 접수되었습니다.</p>
	<p>질문의 답변까지는 주말을 제외하고 2~3일이 소요될 수 있습니다.</p>
	<p>문의 답변 시간 : 평일 09:00 ~ 17:00</p>
	
	<div>
		<a href="/proj21_funding/board_servicecenter/servicecenter_write"><input type="button" value="다른 문의하기" ></a>
		<a href="/proj21_funding/board_servicecenter/servicecenter_view_user"><input type="button" value="내 문의 내역 확인하기" ></a>
	</div>	
	
	</section>
		<footer>
			<jsp:include page="/WEB-INF/view/home/footer_menu.jsp"/> 
			<jsp:include page="/WEB-INF/view/home/footer_info.jsp"/> 
		</footer>		

	
	</section>
</body>
</html>