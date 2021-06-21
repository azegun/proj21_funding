<%@ page import="proj21_funding.service.impl.BoardServiceImpl"%>
<%@ page import="proj21_funding.service.BoardService"%>
<%@ page import="proj21_funding.service.impl.CategoryServiceImpl"%>
<%@ page import="proj21_funding.service.CategoryService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link rel="stylesheet" href="/proj21_funding/css/servicecenter_view.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/home_css/main.css">
<style>
table {
	border: 1px solid;
}

td {
	border: 1px solid;
}
</style>
</head>
<body>
페이지 ${pagination }
유저 ${authInfo }
	<div class="container">
		<header>
			<jsp:include page="/WEB-INF/view/home/header_top.jsp" />
			<jsp:include page="/WEB-INF/view/home/header_account.jsp" />
		</header>
		<section class="notice_view">
			<h2>공지사항</h2>
			<table>
				<tr>
					<td>제목</td>
					<td><c:forEach var="bc" items="${bc }">
							<c:if test="${bc.categoryNo eq board.categoryNo.categoryNo }">
							[${bc.categoryName }]
						</c:if>
						</c:forEach> ${board.boardTitle }</td>
				</tr>
				<tr>
					<td>작성일</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${board.boardDate }"/></td>
				</tr>
				<tr>
					<td>본문</td>
					<td>${board.boardContent }</td>
				</tr>
			</table>
			<a href="<%=request.getContextPath()%>/board/list?currentPage=${pagination.currentPage }&cntPerPage=${pagination.cntPerPage }&pageSize=${pagination.pageSize }"><button id="go_notice">목록보기</button></a>
			<c:if test="${authInfo.userNo < 0 }">
				<a href="<%=request.getContextPath()%>/noticeupdate/${board.boardNo }&${board.categoryNo.categoryNo }"><button id="noticeUpdate">수정</button></a>
				<a href="<%=request.getContextPath()%>/noticedelete/${board.boardNo }&${board.categoryNo.categoryNo }"><button id="noticeDelete">삭제</button></a>
			</c:if>
		</section>
		<footer>
			<jsp:include page="/WEB-INF/view/home/footer.jsp" />
		</footer>
	</div>
</body>
</html>

<!-- 참고사이트 : https://www.cjlogistics.com/ko/support/faq -->