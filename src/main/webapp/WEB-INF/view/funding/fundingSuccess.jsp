<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>100펀딩-후원완료</title>
<link rel="shortcut icon" href="favicon.ico">
<link rel="icon" href="favicon.ico">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/home_css/main.css">
</head>
<body>
${authInfo.userNo }<br>
${buyOption }<br>
${prjInfo }<br>
${ui }
<div class="container">
	<header>		   
		<jsp:include page="/WEB-INF/view/home/header.jsp"/>
	</header>
	<section>
		<h3>성공적으로 펀딩이 완료되었습니다.</h3>
		<button type="button" onclick="location.href='<%=request.getContextPath()%>/'">메인으로 -></button>
		<button type="button" onclick="location.href='<%=request.getContextPath()%>/user/funding_status/${authInfo.userNo}'">후원한 프로젝트 보기</button>
	</section>

</div>
</body>
</html>