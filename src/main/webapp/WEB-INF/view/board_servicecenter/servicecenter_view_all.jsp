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
	<h4>자주 묻는 질문</h4>
	<p>고객님께서 자주 문의하시는 질문과 답변을 모았습니다.</p>
	<input type="text" id="qnaserch" placeholder="궁금하신 점이 있다면 여기서 먼저 찾아보세요."><button>search</button>
	<table class="table">
			<td id="qnaNo">번호</td>
			<td id="qnaTitle">제목</td>
			<td id="qnaContent">내용</td>
	</table>
	<p>궁금함을 해결하지 못하셨나요?</p>
	<p><a href="/proj21_funding/board_servicecenter/servicecenter_write">
	<button>1:1 문의하기</button></a>
	</p>
	</section>
		<footer>
			<jsp:include page="/WEB-INF/view/home/footer.jsp"/> 
		</footer>
		</div>
</body>
</html>

<!-- 참고사이트 : https://www.cjlogistics.com/ko/support/faq -->