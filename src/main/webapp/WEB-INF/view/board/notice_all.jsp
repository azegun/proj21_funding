<%@ page import="proj21_funding.service.impl.BoardServiceImpl"%>
<%@ page import="proj21_funding.service.BoardService"%>
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
<title>공지사항</title>
<link rel="stylesheet" href="/proj21_funding/css/servicecenter_view.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/home_css/main.css">
<style>
	table {border : 1px solid;}
	td {border : 1px solid;}
</style>
</head>
<body>
	<div class="container">
		<header>		   
			<jsp:include page="/WEB-INF/view/home/header_top.jsp"/> 
			<jsp:include page="/WEB-INF/view/home/header_account.jsp"/> 
		</header>
	<section class = "sevicecenter_view">
	<h2>공지사항</h2>
	<div>
		<select name="category">
			<c:forEach var="bc" items="${bc }">
				<c:if test="${bc.categoryClass eq 'board' }" >
					<option value="${bc.categoryNo }">${bc.categoryName }</option>
				</c:if>
			</c:forEach>
		</select>
		<input type="button" value="조회">
	</div>
	<table>
		<c:forEach var="board" items="${board }">
			<tr>
				<td>${board.boardNo }</td>
				<td>
					<c:forEach var="bc" items="${bc }">
						<c:if test="${bc.categoryNo eq board.categoryNo.categoryNo }" >
							${bc.categoryName }
						</c:if>
					</c:forEach>
				</td>
				<td><a href="/board/notice_all/${board.boardNo }">${board.boardTitle }</a></td>
				<td>${board.boardDate }</td>
			</tr>
		</c:forEach>
	</table>
	<a href="<%=request.getContextPath() %>/board/notice_write"><input type="button" value="공지글 작성"></a>
	</section>
		<footer>
			<jsp:include page="/WEB-INF/view/home/footer.jsp"/> 
		</footer>
		</div>
</body>
</html>

<!-- 참고사이트 : https://www.cjlogistics.com/ko/support/faq -->