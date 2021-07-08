<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>100펀딩-후원현황</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/home_css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/user_css/funding_status.css">
</head>
<body>
${count }
<%-- ${fundingList }
후원현황 --%>
<div class="container">
		<header>		   
			<jsp:include page="/WEB-INF/view/home/header.jsp"/>
		</header>
		<section class = "funding_main">
		<table class = "funding_table">
			<tr class="tablehead">
				<th> </th><th>프로젝트명</th><th>옵션명</th><th>옵션내용</th><th>가격</th>
				<th>마감일(결제일)</th><th>결제여부</th><th>마감여부</th>
			</tr>
			<c:forEach var="funding" items="${fundingList }">
			<tr>
				<td><img src="<%=request.getContextPath()%>/images/project/project${funding.prjNo.prjNo }.jpg"/>
				<td class="link"><a id = "pointer" href="<%=request.getContextPath()%>/prjDetail/${funding.prjNo.prjNo}">${funding.prjNo.prjName }</a></td>
				<td>${funding.optNo.optName }</td>
				<td>${funding.optNo.optContent}</td>
				<td><fmt:formatNumber value="${funding.optNo.optPrice}" pattern="#,###"/>원</td>
				<td>${funding.prjNo.endDate}</td>
				<c:choose>
					<c:when test="${funding.payYn eq true}">
						<td>결제완료</td>
					</c:when>
					<c:otherwise>
						<td>미결제</td>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${funding.endYn eq true}">
						<td>마감 완료</td>
					</c:when>
					<c:otherwise>
						<td>진행중</td>
					</c:otherwise>
				</c:choose>
			</tr>
			</c:forEach>
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
		</section>
		<footer>
			<jsp:include page="/WEB-INF/view/home/footer.jsp"/>
		</footer>
</div>
</body>
<script>
function movePage(currentPage, cntPerPage, pageSize){
    
    var url = "${pageContext.request.contextPath}/user/funding_status/${authInfo.userNo}";
    url = url + "?currentPage="+currentPage;
    url = url + "&cntPerPage="+cntPerPage;
    url = url + "&pageSize="+pageSize;
    
    
    location.href=url;
}
</script>
</html>