<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/project_list_css/prjBoard.css">
<script type="text/javascript">
	function openWrite(){		
		window.open('<%=request.getContextPath()%>/prjBoard/prjBoard-write', '', 'left = 600, top = 150, width = 500, height = 500');
	}
</script>
</head>
<body>	
	<fieldset id="prjBoardArea">
		<button onclick="openWrite()" value="${prjNo}">글쓰기</button>
		<section>
			<c:forEach items="${board}" var="board">
				<fieldset>
					<div id="nickName">${board.userNo.nickName}</div>				
					<div id="postDate"><tf:formatDateTime value="${board.postDate}" pattern="yyyy-MM-dd" /></div>				
					<div id="postFile">${board.postFile}</div>
					<div id="postContent">${board.postContent}</div>
				</fieldset>	
			</c:forEach>
		</section>
	</fieldset>
</body>
</html>