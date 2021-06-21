<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
		$(function(){
			var dateSelector = document.querySelector('.dateSelector');
			dateSelector.flatpicker();
		});
		

</script>
</head>
<!--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="/proj21_funding/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/proj21_funding/bootstrap/css/bootstrap-theme.min.css">
<script type="text/javascript" src="/proj21_funding/bootstrap/js/bootstrap.min.js"></script> -->
	</head>
			<body>
			<div class = "reservation">
				<div>
					<p>예약일</p>
					<input class = "dateSelector" placeholder = "ex)2020-09-01"/>
				</div>
			</div>
			
			</body>
			</html>