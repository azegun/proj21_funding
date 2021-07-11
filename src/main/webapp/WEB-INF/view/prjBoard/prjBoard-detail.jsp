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
<script src="https://code.jquery.com/jquery-3.5.1.js"  ></script>
<script type="text/javascript">
	function modifyBoard(){	
		window.open('<%=request.getContextPath()%>/prjBoard/prjBoard-write?postNo=${prBoard.postNo}', '', 'left = 600, top = 150, width = 500, height = 500');
	 }
</script>
</head>
<body>
	<fieldset id="prjBoardDetailArea">
	<a href="<c:url value='/prjDetail/${prBoard.prjNo}#prjBoard'/>"><button type="button">다른 게시글 보기</button></a>			
			<section>						
				<div id="nickName">${prBoard.userNo.nickName}</div>				
				<div id="postDate"><tf:formatDateTime value="${prBoard.postDate}" pattern="yyyy-MM-dd" /></div>				
				<c:if test="${!empty prBoard.postFile}">					
					<div id="postFile"><img src="data:image/jpeg;base64,${img}" alt="img"></div>	
				</c:if>
				<div id="postContent">${prBoard.postContent}</div>
			</section>
			<div id="btn">
				<button type="button" onclick="modifyBoard()">수정</button>
				<a href="<c:url value="/prjDetail/deleteBoard?postNo=${prBoard.postNo}"/>"><button type="button">삭제</button></a>	
			</div>
					
			<p>-----------------------------------------------------------------</p>
		<form:form modelAttribute="prjBoardReply" action="registerReply">
			<div><form:hidden path="postNo" value="${prBoard.postNo}"/></div>
			<div>
				<form:textarea path="replyContent"/>								
				<form:button id="registerReplyBtn">등록하기</form:button>	
				<p id="errors">${err}&nbsp;</p>			
			</div>
		</form:form>		
		<section>						
			<c:forEach items="${boardReply}" var="reply">
				<p>
					<label id="nickName">${reply.userNo.nickName} : </label>				
					<label id="replyContent">${reply.replyContent}</label>						
				</p>	
				<div id="reBtn">						
					<a href="<c:url value="/prjDetail/deleteReply?postNo=${prBoard.postNo}&replyNo=${reply.replyNo}"/>"><button type="button">삭제</button></a>	
				</div>
			</c:forEach>				
		</section>
	</fieldset>
</body>
</html>