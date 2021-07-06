<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<fieldset id="prjBoardDetailArea">
	<button type="button" onclick="history.back(-1);">다른 게시글 보기</button>
		<section>
			<div id="nickName">${prjBoard.userNo.nickName}</div>				
			<div id="postDate"><tf:formatDateTime value="${prjBoard.postDate}" pattern="yyyy-MM-dd" /></div>				
			<c:if test="${!empty prjBoard.postFile}">					
				<div id="postFile"><img src="data:image/jpeg;base64,${img}" alt="img"></div>	
			</c:if>
			<div id="postContent">${prjBoard.postContent}</div>
		</section>
		<p>-----------------------------------------------------------------</p>
		<section>
		<form:form modelAttribute="prjBoardReply">
			<div>		
				<form:textarea path="replyContent"/>
				<form:button>등록하기</form:button>
			</div>	
			<p id="errors">${err}&nbsp;</p>			
			<c:forEach items="${boardReply}" var="reply">
				<p><label>${reply.userNo.nickName} : </label>				
				${reply.replyContent}</p>			
			</c:forEach>		
		</form:form>		
		</section>
	</fieldset>
</body>
</html>