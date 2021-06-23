<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자-프로젝트관리</title>
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
	href="/proj21_funding/css/admin_css/adminProject.css">
<script>
	$(function() {
		$(window).scroll(function() {
			if ($(this).scrollTop() > 500) {
				$('#MOVE_TOP_BTN').fadeIn();
			} else {
				$('#MOVE_TOP_BTN').fadeOut();
			}
		});

		$("#MOVE_TOP_BTN").click(function() {
			$('html, body').animate({
				scrollTop : 0
			}, 400);
			return false;
		});
	});
</script>
</head>
<body>
${prjList }
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set> 
	<div id="page-wrapper">
		<header>
			<!-- 사이드바 -->
			<div id="sidebar-wrapper">
				<ul class="sidebar-nav">
					<li class="sidebar-brand"><a href="#">100펀딩 관리자 페이지</a></li>
					<li><a href="adminMember">회원관리</a></li>
					<li><a href="adminProject">프로젝트관리</a></li>
					<li><a href="#">게시판관리</a></li>
					<li><a href="#">메뉴 4</a></li>
					<li><a href="#">메뉴 5</a></li>
				</ul>
			</div>
			<!-- /사이드바 -->
		</header>
		<!-- 본문 -->
		<div id="page-content-wrapper">
			<div class="container-fluid">
				<section>
					<h1>회원관리</h1>
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
				<table class="table table-stripedPink table-bordered ">
					<thead>
						<tr>
							<th class="col-md-1 text-center">번 호</th>
							<th class="col-md-3 text-center">제 목</th>
							<th class="col-md-1 text-center">분 류</th>
							<th class="col-md-1 text-center">제작자</th>
							<th class="col-md-1 text-center">목표금액</th>
							<th class="col-md-1 text-center">현재금액</th>
							<th class="col-md-1 text-center">달성률</th>
							<th class="col-md-1 text-center">마감일</th>
							<th class="col-md-1 text-center">상태</th>
						</tr>
	 				</thead>
					<tbody>
						<c:forEach var="prj" items="${prjList }" varStatus="status">
							<tr data-toggle="collapse"
								data-target="#accordion${status.index }"
								class="text-center clickable">
								<td>${prj.prjNo}</td>
								<td>${prj.prjName }</td>
								<td>${prj.pCategoryName }</td>
								<td>${prj.prjManager }</td>
								<td><fmt:formatNumber value="${prj.prjGoal }" pattern="#,###"/> 원</td>
								<td><fmt:formatNumber value="${prj.totalPrice }" pattern="#,###"/> 원</td>
								<td>${prj.rate }%</td>
								<td>${prj.endDate }</td>
								<td>
									<c:if test="${prj.prjGoal<=prj.totalPrice }">목표 달성</c:if>
									<c:if test="${prj.prjGoal>prj.totalPrice and sysYear>prj.endDate}">달성 실패</c:if>
									<c:if test="${prj.prjGoal>prj.totalPrice and sysYear<prj.endDate}">진행중</c:if>
								</td>
							</tr>
							<tr>
								<td colspan="9">
									<div id="accordion${status.index }" class="collapse">
									<h4><strong>프로젝트상세정보</strong></h4>
									<div class="panel panel-default">
										<div class="panel-heading"><strong>개인 정보</strong></div>
										<div class="panel-body">
										
										<span class="userDetail"><strong>제 목 : </strong> <input type="text" value="${prj.prjName }" size="10px" readonly/></span>
										<span class="userDetail"><strong>분 류 : </strong><input type="text" value="${prj.pCategoryName }" size="10px" readonly/></span>
										<span class="userDetail"><strong>제작자 : </strong><input type="text" value="${prj.prjManager }" size="10px" readonly/></span><br>
										<div class="progress1">
										  <div class="progress-bar1" role="progressbar" aria-valuenow="${prj.rate }" aria-valuemin="0" aria-valuemax="100" style="min-width: 2em; width:${prj.rate}%">
										    ${prj.rate }
										  </div>
										</div>
										<span class="userDetail"><strong>목표금액 : </strong>
										<input type="text" value="<fmt:formatNumber value="${prj.prjGoal }" pattern="#,###"/> 원" size="10px" readonly/>
										</span>
										<span class="userDetail"><strong>현재금액 :</strong> 
										<input type="text" value="<fmt:formatNumber value="${prj.totalPrice }" pattern="#,###"/> 원" size="10px" readonly/></span><br>
										  <span>${prj.rate }</span>
										<span class="userDetail"><strong>은행 :</strong> 
										<input type="text" value="${user.bankName }" size="10px" readonly/></span>
										<span class="userDetail"><strong>계좌번호 :</strong> 
										<input type="text" value="${user.bankAccount }" size="15px" readonly/></span>
										</div>
									</div>
									</div>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>