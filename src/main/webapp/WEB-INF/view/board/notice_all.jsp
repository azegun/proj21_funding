<%@ page import="proj21_funding.service.impl.BoardServiceImpl"%>
<%@ page import="proj21_funding.service.BoardService"%>
<%@ page import="proj21_funding.service.impl.CategoryServiceImpl"%>
<%@ page import="proj21_funding.service.CategoryService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
				<td><a href="<%=request.getContextPath() %>/board/notice_detail/${board.boardNo }">${board.boardTitle }</a></td>
				<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${board.boardDate }"/></td>
			</tr>
		</c:forEach>
	</table>
	<%-- <div>
		<c:if test="${pagination.curRange ne 1 }">
			<a href="#" onClick="fn_paging(1)">[처음]</a> 
		</c:if>
		<c:if test="${pagination.curPage ne 1}">
			<a href="#" onClick="fn_paging('${pagination.prevPage }')">[이전]</a> 
		</c:if>
		<c:forEach var="pageNum" begin="${pagination.startPage }" end="${pagination.endPage }">
  			<c:choose>
				<c:when test="${pageNum eq  pagination.curPage}">
					<span style="font-weight: bold;"><a href="#" onClick="fn_paging('${pageNum }')">${pageNum }</a></span> 
				</c:when>
				<c:otherwise>
					<a href="#" onClick="fn_paging('${pageNum }')">${pageNum }</a> 
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}">
			<a href="#" onClick="fn_paging('${pagination.nextPage }')">[다음]</a> 
		</c:if>
		<c:if test="${pagination.curRange ne pagination.rangeCnt && pagination.rangeCnt > 0}">
			<a href="#" onClick="fn_paging('${pagination.pageCnt }')">[끝]</a> 
		</c:if>
	</div>
	<div>
		총 게시글 수 : ${pagination.listCnt } /    총 페이지 수 : ${pagination.pageCnt } / 현재 페이지 : ${pagination.curPage } / 현재 블럭 : ${pagination.curRange } / 총 블럭 수 : ${pagination.rangeCnt }
	</div> --%>
	<c:if test="${authInfo.userNo < 0 }">
		<a href="<%=request.getContextPath() %>/board/notice_write"><input type="button" value="공지글 작성"></a>
	</c:if>
	</section>
		<footer>
			<jsp:include page="/WEB-INF/view/home/footer.jsp"/> 
		</footer>
		</div>
</body>
</html>

<!-- 참고사이트 : https://www.cjlogistics.com/ko/support/faq -->