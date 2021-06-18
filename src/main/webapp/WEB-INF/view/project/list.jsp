<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%=request.getContextPath()%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>100펀딩 - 크리에이터를 위한 크라우드펀딩</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/home_css/main.css">
</head>
<body>

	<div class="container">
		<header>
			<jsp:include page="/WEB-INF/view/home/header.jsp" />
		</header>
		<%-- ${projects } --%>
		<!-- 프로젝트검색 부분 개발중  -->
		<section>
			<form action="projectListSearch" method="post">
				<select name="type">
					<option value="prjName" selected="selected">프로젝트명</option>
					<option value="prjManager">제작자</option>
				</select>
				<input type="text" name="param"/><input type="submit" value="검색">
			</form>
			
		</section>
		<section>
			<jsp:include page="/WEB-INF/view/project/list_section.jsp" />
		</section>

	
	<footer>
		<jsp:include page="/WEB-INF/view/home/footer.jsp" />
	</footer>
	</div>
</body>
</html>