<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<fieldset id="prjBoardwriteArea">
	<form:form modelAttribute="prjBoard">
	<form:errors />
		<form:hidden path="prjNo"/>
		<form:hidden path="userNo"/>		
		<p><form:input path="postFile"/></p>
		<p><form:textarea path="postContent"/><p>	
		<p id="errors"><form:errors path="postContent" />&nbsp;</p>		
		<form:button>등록하기</form:button>
	</form:form>	
	</fieldset>
</body>
</html>