<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="/proj21_funding/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/proj21_funding/bootstrap/css/bootstrap-theme.min.css">
<script type="text/javascript" src="/proj21_funding/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/proj21_funding/css/admin_css/adminSide.css">
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>
//차트버전 최신으로 불러오기
google.charts.load('current', {'packages':['corechart']});
//차트를 로드3
google.charts.setOnLoadCallback(drawVisualization);

function drawVisualization() { 
	var data = google.visualization.arrayToDataTable([
			['Month', 'Bolivia', 'Ecuador', 'Madagascar', 'Papua New Guinea', 'Rwanda', 'Average'],
			['2004/05',  165,      938,         522,             998,           450,      614.6],
			['2005/06',  135,      1120,        599,             1268,          288,      682],
			['2006/07',  157,      1167,        587,             807,           397,      623],
			['2007/08',  139,      1110,        615,             968,           215,      609.4],
			['2008/09',  136,      691,         629,             1026,          366,      569.6]
		]);
	var options = {
			title : 'Monthly Coffee Production by Country',
			vAxis: {title: 'Cups'},
			hAxis: {title: 'Month'}, 
			seriesType: 'bars',
			series: {5: {type: 'line'}}
		};
	
	var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
	chart.draw(data, options);
}
</script>

<script>
</script>
</head>
<body>
<div id="page-wrapper">
<header>
			<!-- 사이드바 -->
			<div id="sidebar-wrapper">
				<ul class="sidebar-nav">
					<li class="sidebar-brand"><a href="admin">100펀딩 관리자 페이지</a></li>
					<li><a class="menu" href="adminMember">회원관리</a></li>
					<li><a class="menu" href="adminProject">프로젝트관리</a></li>
					<li><a class="menu" href="adminBoard">게시판관리</a></li>
					<li><a class="menu" href="adminQna">QnA관리</a></li>
				</ul>
			</div>
			<!-- /사이드바 -->
		</header>
  <!-- 본문 -->
  <div id="page-content-wrapper">
    <div class="container-fluid">
    	
    	<h1>메인화면</h1>
    	
    	<div id="chart_div">
    	
    	</div>
    </div>
  </div>
</div>  
  <!-- /본문 -->


 
</body>
</html>
