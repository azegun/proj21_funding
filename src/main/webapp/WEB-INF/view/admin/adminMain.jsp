<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
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
google.charts.setOnLoadCallback(drawVisualization1);
google.charts.setOnLoadCallback(lineChart);
google.charts.setOnLoadCallback(salesRankingChart);
google.charts.setOnLoadCallback(sponsorRankingChart);

	function salesRankingChart(){
		var data = google.visualization.arrayToDataTable([
			['프로젝트명','매출액',{role:'annotation'}],
			['${salesRanking[0].prjName}',${salesRanking[0].totalPrice},'${salesRanking[0].totalPrice}원'],
			['${salesRanking[1].prjName}',${salesRanking[1].totalPrice},'${salesRanking[1].totalPrice}원'],
			['${salesRanking[2].prjName}',${salesRanking[2].totalPrice},'${salesRanking[2].totalPrice}원'],
			['${salesRanking[3].prjName}',${salesRanking[3].totalPrice},'${salesRanking[3].totalPrice}원'],
			['${salesRanking[4].prjName}',${salesRanking[4].totalPrice},'${salesRanking[4].totalPrice}원']
		]);
		
		 var options = {
			        title: "프로젝트별 매출액 랭킹  Top5",
			        bar: {groupWidth: "50%"},
			        legend: { position: "bottom" }
		};
		 
		 var chart = new google.visualization.BarChart(document.getElementById("projectRankingChart"));
	     chart.draw(data, options);
	}
	function sponsorRankingChart(){
		var data = google.visualization.arrayToDataTable([
			['회원','후원 횟수',{role:'annotation'}],
			['${sponsorRanking[0].sponsorName}(${sponsorRanking[0].sponsor})',${sponsorRanking[0].totalCount},'${sponsorRanking[0].totalCount}회'],
			['${sponsorRanking[1].sponsorName}(${sponsorRanking[1].sponsor})',${sponsorRanking[1].totalCount},'${sponsorRanking[1].totalCount}회'],
			['${sponsorRanking[2].sponsorName}(${sponsorRanking[2].sponsor})',${sponsorRanking[2].totalCount},'${sponsorRanking[2].totalCount}회'],
			['${sponsorRanking[3].sponsorName}(${sponsorRanking[3].sponsor})',${sponsorRanking[3].totalCount},'${sponsorRanking[3].totalCount}회'],
			['${sponsorRanking[4].sponsorName}(${sponsorRanking[4].sponsor})',${sponsorRanking[4].totalCount},'${sponsorRanking[4].totalCount}회']
		]);
		
		 var options = {
			        title: "후원자별 후원수 랭킹  Top5",
			        bar: {groupWidth: "50%"},
			        legend: { position: "bottom"},
			        series:{
			        	0:{color:'orange'}
			        }
		};
		 
		 var chart = new google.visualization.BarChart(document.getElementById("sponsorRankingChart"));
	     chart.draw(data, options);
	}
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
	
	
	function lineChart(){
		console.log(${fn:length(salesStat)})
	 	var arr = [
			['기간','후원수','금액'],
			['${salesStat[0].period}',${salesStat[0].count1},${salesStat[0].sum1}],
			['${salesStat[1].period}',${salesStat[1].count1},${salesStat[1].sum1}],
			['${salesStat[2].period}',${salesStat[2].count1},${salesStat[2].sum1}]
			]; 
		
		var dataTable = google.visualization.arrayToDataTable(arr);
		
		var options = {
				title: '100펀딩 월별 후원수 및 매출 현황',
				/* vAxis : {0: {logScale: false},
		            	 1: {logScale: false}
						}, */
				legend : {position:'bottom'},
 				series : {0:{targetAxisIndex:0,axis:'후원수'},
					      1:{targetAxisIndex:1}} ,
				vAxes:{0:{title:'후원수'},
					   1:{title:'매출'}},
		};
		
		var objDiv = document.getElementById('line_chart');
		
		var chart = new google.visualization.LineChart(objDiv);
		chart.draw(dataTable,options)
	}
	
	
	function drawVisualization1() {
		  // Create and populate the data table.
		  var data = new google.visualization.DataTable();
		  data.addColumn('string', 'x');
		  data.addColumn('number', 'Cats');
		  data.addColumn('number', 'Blanket 1');
		  data.addColumn('number', 'Blanket 2');
		  data.addRow(["A", 1, 1, 0.5]);
		  data.addRow(["B", 2, 0.5, 1]);
		  data.addRow(["C", 4, 1, 0.5]);
		  data.addRow(["D", 8, 0.5, 1]);
		  data.addRow(["E", 7, 1, 0.5]);
		  data.addRow(["F", 7, 0.5, 1]);
		  data.addRow(["G", 8, 1, 0.5]);
		  data.addRow(["H", 4, 0.5, 1]);
		  data.addRow(["I", 2, 1, 0.5]);
		  data.addRow(["J", 3.5, 0.5, 1]);
		  data.addRow(["K", 3, 1, 0.5]);
		  data.addRow(["L", 3.5, 0.5, 1]);
		  data.addRow(["M", 1, 1, 0.5]);
		  data.addRow(["N", 1, 0.5, 1]);


		  // Create and draw the visualization.
		  new google.visualization.LineChart(document.getElementById('visualization')).
		      draw(data, {curveType: "function", width: 500, height: 500,
		    vAxes: {0: {logScale: false},
		            1: {logScale: false, maxValue: 2}},
		    series:{
		       0:{targetAxisIndex:0},
		       1:{targetAxisIndex:1},
		       2:{targetAxisIndex:1}}}
		          );
		}
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
    	<button class="goMain" onclick="location.href='<%=request.getContextPath()%>'">메인으로 이동</button>
		<button class="goMain" onclick="location.href='<%=request.getContextPath()%>/logout'">로그아웃</button>
    	<h1>메인화면</h1>
    	
    	<div id="line_chart" style="width:100%; height:500px;"></div>
    	<div id="projectRankingChart" style="width:49%; height:500px; display:inline-block"></div>
    	<div id="sponsorRankingChart" style="width:49%; height:500px; display:inline-block"></div>
    	<div id="chart_div"></div>
    	<div id="visualization"></div>
    </div>
  </div>
</div>  
  <!-- /본문 -->


 
</body>
</html>
