<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자-게시판관리</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="/proj21_funding/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/proj21_funding/bootstrap/css/bootstrap-theme.min.css">
<script type="text/javascript"
	src="/proj21_funding/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="/proj21_funding/css/admin_css/adminSide.css">
<link rel="stylesheet"
	href="/proj21_funding/css/admin_css/adminBoard.css">
</head>
<body>
	<div id="page-wrapper">
		<header>
			<!-- 사이드바 -->
			<div id="sidebar-wrapper">
				<ul class="sidebar-nav">
					<li class="sidebar-brand"><a href="#">100펀딩 관리자 페이지</a></li>
					<li><a href="adminMember">회원관리</a></li>
					<li><a href="adminProject">프로젝트관리</a></li>
					<li><a href="adminBoard">게시판관리</a></li>
				</ul>
				
			</div>
			<!-- /사이드바 -->
		</header>
		<div id="page-content-wrapper">
			<div class="container-fluid">
				<button class="goMain" onclick="location.href='<%=request.getContextPath()%>'">메인으로 이동</button>
				<section>
					<h1>게시판관리</h1>
				</section>
				<div class="panel panel-default">
					<div class="panel-heading">
						<strong>프로젝트 통계</strong>
					</div>
					<div class="panel-body">
						<ul>
							<li><strong>누적 프로젝트 수</strong> : 개</li>
							<li><strong>성공한 프로젝트 수</strong> : 개</li>
							<li><strong>제작자 수</strong> : ${prdCount }명</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>