<%@ page import="proj21_funding.service.impl.CategoryServiceImpl"%>
<%@ page import="proj21_funding.service.CategoryService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	<section class = "sevicecenter_view_detail">	
	<h2>고객센터</h2>
	<nav>
		<ul>
			<li><a href="/proj21_funding/servicecenter/all_view">자주 묻는 질문</a></li>
			<c:choose>
				<c:when test="${authInfo.userNo < 0 }">
					<li value="${authInfo.userNo }"><a href="/proj21_funding/servicecenter/admin_view">모든 질문 보기</a></li>
				</c:when>
				<c:otherwise>
					<li value="${authInfo.userNo }"><a href="/proj21_funding/servicecenter/user_view">내 질문</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</nav>	
		<table>
		<tr>
			<td class="td_left"><label for="categoryNo">질문 분류</label></td>
			<td class="td_right">
				<c:forEach var="bc" items="${bc }">
					<c:if test="${bc.categoryNo eq qna.categoryNo.categoryNo }" >
						${bc.categoryName }
					</c:if>
				</c:forEach>
			</td>
		</tr>
		<tr>
			<td class="td_left"><label for="qnaTitle">제목</label></td>
			<td class="td_right">${qna.qnaTitle }</td>
		</tr>
		<tr>
			<td class="td_left"><label for="userNo">질문자</label></td>
			<td class="td_right">${user.nickName }</td>
		</tr>
		<tr>
			<td class="td_left"><label for="qnaDate">질문날짜</label></td>
			<td class="td_right"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${qna.qnaDate }"/></td>
		</tr>
		<tr>
			<td class="td_left"><label for="qnaContent">내용</label></td>
			<td class="td_right">${qna.qnaContent }</td>
		</tr>
		<c:choose>
			<c:when test ="${qna.qnaReply ne null }">
				<tr>
					<td class="td_left"><label for="replyDate">답변날짜</label></td>
					<td class="td_right"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${qna.replyDate }"/></td>
				</tr>
				<tr>
					<td class="td_left"><label for="qnaReply">답변내용</label></td>
					<td class="td_right">${qna.qnaReply }</td>
				</tr>
			</c:when>
			<c:when test ="${qna.qnaReply eq null }">
				<tr>
					<td class="td_left"><label for="replyDate">답변날짜</label></td>
					<td class="td_right">0000-00-00</td>
				</tr>
				<tr>
					<td class="td_left"><label for="qnaReply">답변내용</label></td>
					<td class="td_right"><p>답변을 준비 중입니다.</p>
						<p>질문의 답변까지는 주말을 제외하고 2~3일이 소요될 수 있습니다.</p>
						<p>문의 답변 시간 : 평일 09:00 ~ 17:00</p>
					</td>
				</tr>
			</c:when>
		</c:choose>
		</table>
		<c:if test="${authInfo.userNo < 0 }">
			<a href="/proj21_funding/servicecenter/admin_view?currentPage=${pagination.currentPage }&cntPerPage=${pagination.cntPerPage }&pageSize=${pagination.pageSize }"><button>돌아가기</button></a>
			<a href="<%=request.getContextPath() %>/servicecenter/admin_reply/${qna.qnaNo}"><input type="button" value="답변하기"></a>
		</c:if>
		<c:if test="${authInfo.userNo > 0 }">
			<a href="/proj21_funding/servicecenter/user_view?currentPage=${pagination.currentPage }&cntPerPage=${pagination.cntPerPage }&pageSize=${pagination.pageSize }"><button>돌아가기</button></a>
			<a href="<%=request.getContextPath() %>/delete/${qna.qnaNo}"><input type="button" value="삭제하기"></a>
		</c:if>
	<footer>
		<jsp:include page="/WEB-INF/view/home/footer.jsp"/> 
	</footer>
	</section>
	</div>
</body>
</html>