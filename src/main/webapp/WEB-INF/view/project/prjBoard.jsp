<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/project_list_css/prjBoard.css">
</head>
<body>
	<fieldset id="prjBoardArea">
		<button>글쓰기</button>
		<section>
			<c:forEach items="${board}" var="board">
				<fieldset>
				<%-- postNo = "${board.postNo}"<br> --%>
				userNo = ${board.userNo.nickName}<br>
				postDate = ${board.postDate}<br>
				postFile = ${board.postFile}<br>
				postContent = ${board.postContent}<br>	
				</fieldset>	
			</c:forEach>
		</section>
	</fieldset>
</body>
</html>