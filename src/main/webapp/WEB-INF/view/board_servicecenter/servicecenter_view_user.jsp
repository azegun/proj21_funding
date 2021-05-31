<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
<link rel="stylesheet" href="/proj21_funding/css/servicecenter_view.css">
<link rel="stylesheet" href="/proj21_funding/home_css/main.css">
</head>
<body>
	<div class="container">
		<header>		   
			<jsp:include page="/WEB-INF/view/home/header_top.jsp"/> 
			<jsp:include page="/WEB-INF/view/home/header_account.jsp"/> 
		</header>
	<h2>고객센터</h2>
	<nav>
		<ul>
			<li><a href="/proj21_funding/board_servicecenter/servicecenter_view_all">자주 묻는 질문</a></li>
			<li><a href="/proj21_funding/board_servicecenter/servicecenter_view_user">내 질문</a></li>
		</ul>
	</nav>
	<!-- 여기서부터는 내 질문 페이지 -->
	<h4>내가 한 질문</h4>
	<p>고객님이 하신 1:1 질문내역 페이지입니다.</p>
		<table class="table">
			<td id="qnaNo">번호</td>
			<td id="qnaTitle">제목</td>
			<td id="qnaContent">내용</td>
	</table>
	<!-- 페이지 구성 자체는 동일하게 만들면 될 듯. 클릭시 내 질문 내역과 답변 내역 한 눈에 볼 수 있게. -->
	</p>
		<footer>
			<jsp:include page="/WEB-INF/view/home/footer.jsp"/> 
		</footer>
		</div>
</body>
</html>

<!-- 참고사이트 : https://www.cjlogistics.com/ko/support/faq -->