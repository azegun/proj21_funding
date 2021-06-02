<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보관리</title>
</head>
<body>
	<form:form modelAttribute="userChangePw">
	<p>
		<label>현재 비밀번호:<br>
		<form:input path="currentUserPw"/>
		<form:errors path="currentUserPw" />
		</label>
	</p>
	<p>
		<label>변경 비밀번호:<br>
		<form:input path="newUserPw"/>
		<form:errors path="newPUserPw" />
		</label>
	</p>
	<p>
		<label>변경 비밀번호확인:<br>
		<form:input path="confirmUserPw"/>
		<form:errors path="confirmUserPw" />
		</label>
	</p>
	<input type="submit" value="변경하기">
	</form:form>
</body>
</html>