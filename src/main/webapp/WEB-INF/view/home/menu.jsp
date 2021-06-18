<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Menu</title>
		<link rel="stylesheet" href="<%=request.getContextPath() %>/css/home_css/menu.css">
		<link rel="stylesheet" href=" <%=request.getContextPath() %>/css/home_css/main.css">
</head>
<body>
			<header>		   
					<jsp:include page="/WEB-INF/view/home/header_top.jsp"/>
			</header>
		<section id = "menulist">
		<div class = project_all>
			<a href= "<%=request.getContextPath() %>/projectListAll" >모든 프로젝트</a>	
		</div>
		<div class = project_rec>
			<a href= "" >추천 프로젝트</a>	
		</div>
		<div class = project_finish>
			<a href= "<%=request.getContextPath() %>/sucessImbakProject">성공 임박 프로젝트</a>			
		</div>
		<div class = project_new>
			<a href= "" >신규 프로젝트</a>	
		</div>
			</section>
</body>
</html>