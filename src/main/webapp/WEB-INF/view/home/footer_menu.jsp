<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>풋터 메뉴</title>
		<link rel="stylesheet" href="/proj21_funding/home_css/footer_menu.css">
		<link rel="stylesheet" href=" <%=request.getContextPath() %>/css/home_css/footer_menu.css">
</head>
<body>	
				<div class = "go_menu">
				<a href = "<%=request.getContextPath() %>/board/notice_all">공지사항</a>
				<a href = "">이용약관</a>
				<a href = "<%=request.getContextPath() %>/board_servicecenter/servicecenter_view_all" id = "go_center">고객센터</a>
				</div>
</body>
</html>