<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>uploadInfo</title>
		<link rel="stylesheet" href="/proj21_funding/upload_css/upload_info.css">
</head>
<body>
	<section id = "info">
		<section id = "info_top">
				<jsp:include page="/WEB-INF/view/upload/info_top.jsp"/>
		</section>
		<section id = "info_mid">
				<jsp:include page="/WEB-INF/view/upload/info_mid.jsp"/>
		</section>
		<section id = "info_bottom">
				<jsp:include page="/WEB-INF/view/upload/info_bottom.jsp"/>
		</section>
	</section>
</body>
</html>