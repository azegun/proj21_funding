<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<link rel="stylesheet" href="/proj21_funding/home_css/header.css">
</head>
<body>					
					<div id = "header_main">
							<jsp:include page="/WEB-INF/view/home/header_top.jsp"/>
					</div>		
					<div id = "header_account">
							<jsp:include page="/WEB-INF/view/home/header_account.jsp"/>					
					</div>
					<div id = "header_menu">
						<jsp:include page="/WEB-INF/view/home/header_menu.jsp"/>	
					</div>							

</body>
</html>