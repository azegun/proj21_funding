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
		/* $(window).scroll(function() {
			if ($(this).scrollTop() < 500) {
				$('#MOVE_TOP_BTN').fadeOut();
			} else {
				$('#MOVE_TOP_BTN').fadeIn();
			}
		}); */

		$("#MOVE_TOP_BTN").click(function() {
			$('html, body').animate({
				scrollTop : 0
			}, 400);
			return false;
		});
		
		/* $('.btn-example').click(function(){
	        var $href = $(this).attr('href');
	        layer_popup($href);
	    });
		
		
	    function layer_popup(el){

	        var $el = $(el);    //레이어의 id를 $el 변수에 저장
	        var isDim = $el.prev().hasClass('dimBg'); //dimmed 레이어를 감지하기 위한 boolean 변수
			
	        	
	        isDim ? $('.dim-layer').fadeIn() : $el.fadeIn();

	        var $elWidth = ~~($el.outerWidth()),
	            $elHeight = ~~($el.outerHeight()),
	            docWidth = $(document).width(),
	            docHeight = $(document).height();

	        // 화면의 중앙에 레이어를 띄운다.
	        if ($elHeight < docHeight || $elWidth < docWidth) {
	            $el.css({
	                marginTop: -$elHeight /2,
	                marginLeft: -$elWidth/2
	            })
	        } else {
	            $el.css({top: 0, left: 0});
	        }

	        $el.find('a.btn-layerClose').click(function(){
	            isDim ? $('.dim-layer').fadeOut() : $el.fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.
	            return false;
	        });

	        $('.layer .dimBg').click(function(){
	            $('.dim-layer').fadeOut();
	            return false;
	        });
 */
	});
</script>
</head>
<body>
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
					<h1>프로젝트관리</h1>
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
				<form action="searchProject" method="post" id="frmSearchProject">
				<label><input type="checkbox" name="successYn" value="1">성공프로젝트만 보기  </label>
				<div class="col-md-4">
					<select name="category" class="selectpicker">
						<option value="total" selected="selected">카테고리명</option>
						<c:forEach var="category" items="${categoryList }" varStatus="status">
						<option value="${category.pCategoryNo }">${category.pCategoryName }</option>
						</c:forEach>
					</select>
					<select name="keyword" class="selectpicker">
						<option value="total" selected="selected">검색키워드</option>
						<option value="prjName">프로젝트명</option>
						<option value="prjManager">제작자</option>
						<option value="nickname">회원별명</option>
					</select>
				</div>
				<input type="text" class="searchKeyword" name="searchKeyword"/>
				<input type="submit" class="searchBtn" value="검색"/>
				<span>검색결과 : ${fn:length(prjList) }개</span>
				</form>
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
								<td class="text-left">${prj.prjName }</td>
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
										<div class="panel-heading"><strong>프로젝트 정보</strong></div>
										<div class="panel-body">
										<div style="float:left">
										<span class="prjTitle"><strong>제 목 : </strong> <input type="text" value="${prj.prjName }" size="50" readonly/></span><br>
										<strong>내 용 : </strong><br>
										<textarea rows="5" cols="50" readonly="readonly">${prj.prjContent }</textarea>
										</div>
										<div>
										<span class="userDetail"><strong>분 류 : </strong><input type="text" value="${prj.pCategoryName }" size="10px" readonly/></span>
										<span class="userDetail"><strong>제작자 : </strong><input type="text" value="${prj.prjManager }" size="10px" readonly/></span><br>
										<span class="userDetail"><strong>목표금액 : </strong>
										<input type="text" value="<fmt:formatNumber value="${prj.prjGoal }" pattern="#,###"/> 원" size="10px" readonly/>
										</span>
										<span class="userDetail"><strong>현재금액 :</strong> 
										<input type="text" value="<fmt:formatNumber value="${prj.totalPrice }" pattern="#,###"/> 원" size="10px" readonly/></span><br>
										<div class="progress1">
										  <span class="progress-bar" role="progressbar" aria-valuenow="${prj.rate }" aria-valuemin="0" aria-valuemax="100" style="min-width: 2em; width:${prj.rate}%">
										    ${prj.rate }
										  </span>
										</div>
										<span class="userDetail"><strong>달성률 : </strong><input type="text" class="prjRate" value="${prj.rate }%"size="10px" readonly/>
										</span><br>
										<span class="userDetail"><strong>시작일 :</strong> 
										<input type="text" value="${prj.startDate }" size="10px" readonly/></span>
										<span class="userDetail"><strong>마감일 :</strong> 
										<input type="text" value="${prj.endDate }" size="15px" readonly/></span>
										<span class="userDetail"><strong>진행 상태 :</strong> 
										<input type="text" value="<c:if test='${prj.prjGoal<=prj.totalPrice }'>목표 달성</c:if><c:if test='${prj.prjGoal>prj.totalPrice and sysYear>prj.endDate}'>달성 실패</c:if><c:if test="${prj.prjGoal>prj.totalPrice and sysYear<prj.endDate}">진행중</c:if>" size="15px" readonly/></span>
										<!--레이어관련  -->
											<a href="#" onclick="window.open('sponsorList/${prj.prjNo }','후원자 리스트','width=1000, height=800, location=no, top=100, left=100')">후원자 리스트 보기</a><br>
										</div>
											<%-- 
											<div class="dim-layer">
											    <div class="dimBg"></div>
											    <div id="layer2" class="pop-layer">
											        <div class="pop-container">
											            <div class="pop-conts">
											                <!--content //-->
											                	<h3>후원자 리스트</h3><hr>
											                    <c:forEach var="pr" items="${prjList}">
											                    ${pr }<br>
											                    </c:forEach>
											                <div class="btn-r">
											                    <a href="#" class="btn-layerClose">Close</a>
											                </div>
											                <!--// content-->
											            </div>
											        </div>
											    </div>
											</div> --%>
										<!--레이어관련  -->
										</div>
									</div>
									</div>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<button  id="MOVE_TOP_BTN">TOP</button>
			</div>
		</div>
	</div>
</body>
</html>