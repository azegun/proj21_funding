<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>uploadInfo</title>
		<link rel="stylesheet" href=" <%=request.getContextPath() %>/css/upload_css/upload_info.css">
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script type="text/javascript">
		$(function(){
			var contextPath = "<%=request.getContextPath()%>";
			$("#register_proj").on("click", function(){
				window.location.href = contextPath+"/upload/register";
			});			
		});
		</script>
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