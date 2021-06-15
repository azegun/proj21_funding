<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>수정</title>
				<link rel="stylesheet" href=" <%=request.getContextPath() %>/css/home_css/main.css">
				<link rel="stylesheet" href=" <%=request.getContextPath() %>/css/upload_css/update.css">
				<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
				<script type="text/javascript">
	$(document).ready(function(){	
			$('ul.tabs li').click(function(){
				var tab_id = $(this).attr('data-tab');

			$('ul.tabs li').removeClass('current');
			$('.register_mid').removeClass('current');

			$(this).addClass('current');
			$("#"+tab_id).addClass('current');
		}); 
	});
			//goback()
			$(function(){
				var contextPath = "<%=request.getContextPath()%>";
				$("#return").on("click", function(){
					console.log(111111)
					/* window.location.href = contextPath+"/updateListCancel"; */
				});			
			});
			
	</script>		
</head>
<body>	
<section class="container">		
		<header>		   
				<jsp:include page="/WEB-INF/view/home/header.jsp"/>
		</header>
		<form action= "<%=request.getContextPath() %>/updateListSuccess" method="post" enctype="multipart/form-data">
		<section id = "register_center">
			<div class="container_tab">
					<ul class="tabs">
							<li class="tab-link current"  id = "tab-click" data-tab="tab-1">프로젝트 정보</li>
							<li class="tab-link"   id = "tab-click2" data-tab="tab-2">옵션</li>
					</ul>		
					<div id="tab-1" class="register_mid current">
							<jsp:include page="/WEB-INF/view/upload/update_prjlist.jsp"/>
					</div>
					<div id="tab-2" class="register_mid">
							<jsp:include page="/WEB-INF/view/upload/update_optlist.jsp"/>
					</div>	
			</div>		
			<div id="update_btns">
					<input type="submit" value="등록"/>&nbsp;
					<input type="reset" value="다시쓰기" />&nbsp; 
					<button id = "return">뒤로</button>
			</div>	
		</section>
		<footer>
			<jsp:include page="/WEB-INF/view/home/footer.jsp"/>
		</footer>
		</form>			
		</section>

</body>
</html>