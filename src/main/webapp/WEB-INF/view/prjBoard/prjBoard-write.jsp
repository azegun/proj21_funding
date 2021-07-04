<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function closeWrite(){		
		opener.document.location.reload();
		self.close();
	}
		

</script>
</head>
<body>
	<fieldset id="prjBoardwriteArea">
	<form:form modelAttribute="prjBoard" enctype="multipart/form-data" method="post">
	<form:errors />
		<form:hidden path="prjNo" value="${prjNo}"/>
		<form:hidden path="userNo.userNo" value="${authInfo.userNo}"/>		
		<p>파일 : <form:input path="postFile" type="file" accept=".jpg, .jpeg, .png"/></p>
		<p><form:textarea path="postContent"/><p>	
		<p id="errors"><form:errors path="postContent" value="${complet}"/>&nbsp;</p>		
		<form:button>등록하기</form:button>
		<form:button type="button" onclick="closeWrite()">닫기</form:button>
	</form:form>	
	</fieldset>
</body>
</html>