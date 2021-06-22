<%@ page import="proj21_funding.service.impl.QNAImpl"%>
<%@ page import="proj21_funding.service.QNAService"%>
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
<title>고객센터</title>
<link rel="stylesheet" href="/proj21_funding/css/servicecenter_view.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/home_css/main.css">
</head>
<body>
	<div class="container">
		<header>
			<jsp:include page="/WEB-INF/view/home/header_top.jsp" />
			<jsp:include page="/WEB-INF/view/home/header_account.jsp" />
		</header>
		<section class="sevicecenter_view">
			<h2>고객센터</h2>
			<nav>
				<ul>
					<li><a
						href="/proj21_funding/servicecenter/all_view">자주
							묻는 질문</a></li>
					<c:choose>
						<c:when test="${authInfo.userNo < 0 }">
							<li value="${authInfo.userNo }"><a
								href="/proj21_funding/servicecenter/admin_view">모든
									질문 보기</a></li>
						</c:when>
						<c:otherwise>
							<li value="${authInfo.userNo }"><a
								href="/proj21_funding/servicecenter/user_view">내
									질문</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</nav>
			<h4>전체 문의 내역 확인</h4>
			<p>전체 문의 내역 확인</p>
			<table class="table">
				<thead>
					<tr>
						<td id="qnaNo">번호</td>
						<td id="qnaTitle">제목</td>
						<td id="qnaDate">문의 날짜</td>
						<td id="qnaState">문의 상태</td>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${fn:length(qna) > 0}">
							<c:forEach items="${qna}" var="qna">
								<%-- <c:forEach var="qna" items="${qna }"> --%>
								<tr>
									<td>${qna.QnaNo }</td>
									<td><a
										href="/proj21_funding/servicecenter/view_detail/${qna.QnaNo}">
											<c:forEach var="bc" items="${bc }">
												<c:if test="${bc.categoryNo eq qna.CategoryNo }">
							[${bc.categoryName }]
						</c:if>
											</c:forEach> ${qna.QnaTitle }
									</a></td>
									<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
											value="${qna.QnaDate }" /></td>
									<td><c:choose>
											<c:when test="${qna.QnaReply eq null }">
						답변 대기 중
					</c:when>
											<c:when test="${qna.QnaReply ne null }">
						답변 완료
					</c:when>
										</c:choose></td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="4">조회된 결과가 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			
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

			<footer>
				<jsp:include page="/WEB-INF/view/home/footer.jsp" />
			</footer>
		</section>
	</div>
</body>
<script> 
//페이지 이동
function movePage(currentPage, cntPerPage, pageSize){
    
    var url = "${pageContext.request.contextPath}/servicecenter/adnub_view";
    url = url + "?currentPage="+currentPage;
    url = url + "&cntPerPage="+cntPerPage;
    url = url + "&pageSize="+pageSize;
    
    location.href=url;
}
 
</script>
</html>

<!-- 참고사이트 : https://www.cjlogistics.com/ko/support/faq -->