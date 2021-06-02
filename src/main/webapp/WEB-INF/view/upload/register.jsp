<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>upload register</title>	
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<link rel="stylesheet" href=" <%=request.getContextPath() %>/css/home_css/main.css">
</head>
<body>
		<section class="container">
		<header>		   
			<jsp:include page="/WEB-INF/view/home/header.jsp"/>
		</header>
		<section id = "register_mid">
			<jsp:include page="/WEB-INF/view/upload/register_mid.jsp"/>		
		</section>
		<footer>
			<jsp:include page="/WEB-INF/view/home/footer.jsp"/>
		</footer>
		</section>

</body>
</html>