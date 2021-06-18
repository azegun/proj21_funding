<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>간단수정</title>
			<link rel="stylesheet" href=" <%=request.getContextPath() %>/css/home_css/main.css">
			<link rel="stylesheet" href=" <%=request.getContextPath() %>/css/mylist_css/mydetail_update.css">
</head>
<body>
			<section class="container">
			<header id = "mydetail_header">		   
					<jsp:include page="/WEB-INF/view/home/header.jsp"/>
			</header>
				<h2>프로젝트</h2>	
				<section id = "detailupdate_content">
				
				
				</section>			
		
			<footer>
					<jsp:include page="/WEB-INF/view/home/footer.jsp"/>
			</footer>
			</section>	
</body>
</html>