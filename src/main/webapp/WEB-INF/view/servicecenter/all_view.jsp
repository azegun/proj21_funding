<%@ page import="proj21_funding.service.impl.QNAImpl"%>
<%@ page import="proj21_funding.service.QNAService"%>
<%@ page import="proj21_funding.service.impl.CategoryServiceImpl"%>
<%@ page import="proj21_funding.service.CategoryService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/home_css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/servicecenter/all_view_top.css">
</head>
<style>
	table{border : 1px solid;}
	td{border : 1px solid;}
</style>
<body>
	<div class="container">
		<header>		   
			<jsp:include page="/WEB-INF/view/home/header_top.jsp"/> 
		</header>
	<section class = "sevicecenter_view">
	<div id="top">
		<div id="top_title">
			<span class="faq">고객센터</span>
		</div>
		<div id="top_category">
		<ul id="titlename">
			<li id="cate"><a href="/proj21_funding/qnaallview" class="catetext">자주 묻는 질문</a></li>
			<c:choose>
				<c:when test="${authInfo.userNo < 0 }">
					<li id="cate" value="${authInfo.userNo }"><a href="/proj21_funding/qnaadminview" class="catetext">모든 질문 보기</a></li>
				</c:when>
				<c:otherwise>
					<li id="cate" value="${authInfo.userNo }"><a href="/proj21_funding/qnauserview" class="catetext">내 질문</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
		</div>
	</div>
	<p class="seolmyoung">고객님께서 자주 문의하시는 질문과 답변을 모았습니다.</p>
	<input type="text" id="qnaserch" placeholder="궁금하신 점이 있다면 여기서 먼저 찾아보세요."><button>search</button>
	<table>
		<c:forEach var="qna" items="${qna }">
			<tr>
				<td>
					<c:forEach var="bc" items="${bc }">
						<c:if test="${bc.categoryNo eq qna.categoryNo.categoryNo }" >
							[${bc.categoryName }]
						</c:if>
					</c:forEach>
					${qna.qnaTitle }</td>
			</tr>
			<tr>
				<td colspan="2">${qna.qnaReply }</td>
			</tr>
		</c:forEach>
	</table>
	<p class="seolmyoung">궁금함을 해결하지 못하셨나요?</p>
	<p class="seolmyoung"><a href="/proj21_funding/qnawrite">
	1:1 문의</a>를 이용해주세요.
	</p>
	</section>
		<footer>
			<jsp:include page="/WEB-INF/view/home/footer.jsp"/> 
		</footer>
		</div>
</body>
</html>

<!-- 참고사이트 : https://www.cjlogistics.com/ko/support/faq -->