<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
<link rel="stylesheet" href="/proj21_funding/css/servicecenter_view.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/home_css/main.css">
</head>
<body>
	<div class="container">
		<header>		   
			<jsp:include page="/WEB-INF/view/home/header_top.jsp"/> 
			<jsp:include page="/WEB-INF/view/home/header_account.jsp"/> 
		</header>
	<section class = "sevicecenter_view">		
	<h2>고객센터</h2>
	<nav>
		<ul>
			<li><a href="/proj21_funding/board_servicecenter/servicecenter_view_all">자주 묻는 질문</a></li>
			<li><a href="/proj21_funding/board_servicecenter/servicecenter_view_user">내 질문</a></li>
		</ul>
	</nav>
	<h4>내가 한 질문</h4>
	<p>고객님이 하신 1:1 질문내역 페이지입니다.</p>
		<table class="table">
			<td id="qnaNo">번호</td>
			<td id="qnaTitle">제목</td>
			<td id="qnaDate">문의 날짜</td>
			<td id="qnaState">문의 상태</td>
	</table>
	</p>
		<footer>
			<jsp:include page="/WEB-INF/view/home/footer.jsp"/> 
		</footer>
		</section>
		</div>
</body>
</html>

<!-- 참고사이트 : https://www.cjlogistics.com/ko/support/faq -->