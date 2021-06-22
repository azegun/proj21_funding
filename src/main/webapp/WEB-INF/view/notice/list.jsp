<%@ page import="proj21_funding.service.impl.BoardServiceImpl"%>
<%@ page import="proj21_funding.service.BoardService"%>
<%@ page import="proj21_funding.service.impl.CategoryServiceImpl"%>
<%@ page import="proj21_funding.service.CategoryService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link rel="stylesheet" href="/proj21_funding/css/servicecenter_view.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/home_css/main.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/notice_css/list.css">
<style>
</style>
</head>
<body>
	<div class="container">
		<header>
			<jsp:include page="/WEB-INF/view/home/header_top.jsp" />
			<jsp:include page="/WEB-INF/view/home/header_account.jsp" />
		</header>
		<section class="notice_view">
			<div class="top">
				<span class="notice">공지사항</span> <select name="category">
					<c:forEach var="bc" items="${bc }">
						<c:if test="${bc.categoryClass eq 'board' }">
							<option value="${bc.categoryNo }">${bc.categoryName }</option>
						</c:if>
					</c:forEach>
				</select> <input type="button" value="조회">
			</div>
			<div class="list">
				<ul>
					<c:choose>
						<c:when test="${fn:length(board) > 0}">
							<c:forEach items="${board}" var="board">
								<%-- <c:forEach var="board" items="${board }"> --%>
								<li class="title-box"><a
									href="<%=request.getContextPath() %>/notice/detail/${board.BoardNo }&${board.CategoryNo}"
									class="notice"><span class="title-box"><span
											class="group"><c:forEach var="bc" items="${bc }">
													<c:if test="${bc.categoryNo eq board.CategoryNo }">
							${bc.categoryName }
						</c:if>
												</c:forEach></span> <span class="title">${board.BoardTitle }</span> <span
											class="date"><fmt:formatDate
													pattern="yyyy-MM-dd HH:mm" value="${board.BoardDate }" /></span></span></a></li>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<span>조회된 결과가 없습니다.</span>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
			<!--paginate -->
			<div class="paginate">
				<div class="paging">
					<a class="direction prev" href="javascript:void(0);"
						onclick="movePage(1,${pagination.cntPerPage},${pagination.pageSize});">
						&lt;&lt; </a> <a class="direction prev" href="javascript:void(0);"
						onclick="movePage(${pagination.currentPage}<c:if test="${pagination.hasPreviousPage == true}">-1</c:if>,${pagination.cntPerPage},${pagination.pageSize});">
						&lt; </a>

					<c:forEach begin="${pagination.firstPage}"
						end="${pagination.lastPage}" var="idx">
						<a
							style="color:<c:out value="${pagination.currentPage == idx ? '#cc0000; font-weight:700; margin-bottom: 2px;' : ''}"/> "
							href="javascript:void(0);"
							onclick="movePage(${idx},${pagination.cntPerPage},${pagination.pageSize});"><c:out
								value="${idx}" /></a>
					</c:forEach>
					<a class="direction next" href="javascript:void(0);"
						onclick="movePage(${pagination.currentPage}<c:if test="${pagination.hasNextPage == true}">+1</c:if>,${pagination.cntPerPage},${pagination.pageSize});">
						&gt; </a> <a class="direction next" href="javascript:void(0);"
						onclick="movePage(${pagination.totalRecordCount},${pagination.cntPerPage},${pagination.pageSize});">
						&gt;&gt; </a>
				</div>
			</div>
			<!-- /paginate -->


			<c:if test="${authInfo.userNo < 0 }">
				<a href="<%=request.getContextPath()%>/notice/write"><input
					type="button" value="공지글 작성"></a>
			</c:if>
		</section>
		<footer>
			<jsp:include page="/WEB-INF/view/home/footer.jsp" />
		</footer>
	</div>
</body>
<script>

//페이지 이동
function movePage(currentPage, cntPerPage, pageSize){
    
    var url = "${pageContext.request.contextPath}/notice/list";
    url = url + "?currentPage="+currentPage;
    url = url + "&cntPerPage="+cntPerPage;
    url = url + "&pageSize="+pageSize;
    
    location.href=url;
}
 
</script>
</html>

<!-- 참고사이트 : https://www.cjlogistics.com/ko/support/faq -->