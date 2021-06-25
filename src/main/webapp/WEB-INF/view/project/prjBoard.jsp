<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/project_list_css/prjBoard.css">
</head>
<body>
${authInfo }<br>
${prj[0]}
	<fieldset id="prjBoardArea">
		<button>글쓰기</button>
		<c:forEach items="" var="">
		
		
		
		</c:forEach>	
	</fieldset>
</body>
</html>