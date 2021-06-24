<%@ page import="proj21_funding.service.impl.CategoryServiceImpl"%>
<%@ page import="proj21_funding.service.CategoryService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의하기 | 고객센터</title>
<link rel="stylesheet" href="/proj21_funding/css/servicecenter_write.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/home_css/main.css">
</head>
<body>
	<section class="container">
		<header>		   
			<jsp:include page="/WEB-INF/view/home/header_top.jsp"/> 
		</header>
	<section class = "sevicecenter_write">	
	<h2>고객센터</h2>
	<nav>
		<ul>
			<li><a href="/proj21_funding/servicecenter/all_view">자주 묻는 질문</a></li>
			<c:choose>
				<c:when test="${authInfo.userNo < 0 }">
					<li value="${authInfo.userNo }"><a href="/proj21_funding/qnaadminview">모든 질문 보기</a></li>
				</c:when>
				<c:otherwise>
					<li value="${authInfo.userNo }"><a href="/proj21_funding/qnauserview">내 질문</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</nav>
	<h2>답변하기</h2>
	<form action="<%=request.getContextPath() %>/qnaRpSuccess" method="post">
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
				<tr>
					<td class="td_left"><label for="qnaReply">답변내용</label></td>
					<td class="td_right"> <textarea name="qnaReply" id="qnaReply" cols="40" rows="15" required="required"></textarea></td>
				</tr>
				<tr>
					<td><input type="hidden" id = "userNo" name = "userNo.userNo"  value ="${authInfo.userNo }"  size = 40   required="required"  readonly="readonly"/></td>
					<td><input type="hidden" id = "qnaNo" name = "qnaNo"  value ="${qna.qnaNo }"  size = 40   required="required"  readonly="readonly"/></td>
				</tr>
		</table>
		<section id="commandCell">
			<input type="submit" value="등록">&nbsp;&nbsp;
			<input type="reset" value="다시쓰기">
		</section>
	</form>
		<a href="/proj21_funding/qnaadminview"><button id="go_qna">돌아가기</button></a>
		</section>
		<footer>
			<jsp:include page="/WEB-INF/view/home/footer_menu.jsp"/> 
			<jsp:include page="/WEB-INF/view/home/footer_info.jsp"/> 
		</footer>		

	
	</section>
</body>
</html>