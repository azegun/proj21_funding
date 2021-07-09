<%@page import="proj21_funding.service.PrjOptionService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${prj[0].prjNo.prjName }</title>
<link rel="shortcut icon" href="/proj21_funding/favicon.ico">
<link rel="icon" href="/proj21_funding/favicon.ico">
<link rel="stylesheet"	href="<%=request.getContextPath()%>/css/home_css/main.css">
<link rel="stylesheet"	href="<%=request.getContextPath()%>/css/project_list_css/detail.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"> </script>
<script>
$(function(){
	var price = 0;
	
	$(".optBox").click(function(){
		$(".optBox").css({"background-color":"white"});
		price = $(this).children(".resPrice").val();
		optNo = $(this).children(".resOptNo").val();
		console.log(optNo)
		console.log(price);
		$(this).css({"background-color":"red"});
		$(".resultPrice").text("가격 : "+price+"원")
		
		$(".fundingForm").children().remove(".price")
		$(".fundingForm").children().remove(".optNo")
		
	var sCont="";
		sCont+="<input type='hidden' class='price' name='price' value='"+price+"'/>";
		sCont+="<input type='hidden' class='optNo' name='optNo' value='"+optNo+"'/>";
		$(".fundingForm").prepend(sCont); 
		sCont="";
		console.log(1);
	}); 
	
	$(".fund").click(function(){
 		console.log(price)
		if('${authInfo}' == ''){
			return alert('로그인을 하셔야합니다.')
		}
 		if(price == 0){
 			return alert('옵션을 선택해주세요')
 		}
 	}) 
	
	/* $('.optBox').each(function(index,item){
		$(item).addClass('opt-'+index);
	}) */
	
});
</script>
</head>
<body>
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set> 
	<div class="container">
		<header>
			<jsp:include page="/WEB-INF/view/home/header.jsp" />
		</header>
		<div class="content">
			<div id="funginginfo">
				<div id="titleheader">
					<div id="title">
						<a href="<%=request.getContextPath() %>/categoryByProject?pCategoryNo=${prj[0].prjNo.pCategoryNo.pCategoryNo}"><span id="titlecate">${prj[0].prjNo.pCategoryNo.pCategoryName }</span></a>
						<h1><c:if test="${sysYear>=prj[0].prjNo.endDate}">[ 마감완료 ]</c:if>${prj[0].prjNo.prjName }</h1>
						<span id="productor">${prj[0].prjNo.userNo.userName }</span>
					</div>
				</div>
				<div id="img">
					<span> <img
						src="<%=request.getContextPath() %>/images/project/project${prj[0].prjNo.prjNo }.jpg" />
					</span>
				</div>
				<aside id="funding-info">
					<div id="huwon">
						<div id="huwon1">
							<span id="huwontab1">모인 금액</span><br>
							<span id="huwontab2">${sum}원</span><span id="huwontab3">${sum/prj[0].prjNo.prjGoal*100 }%</span>
						</div>
						<div id="huwon1">
							<span id="huwontab1">후원자</span><br>
							<span id="huwontab2">${count }명</span>
						</div>
					</div>
					<div id="funding-ing">
						<span id="ing1">펀딩 진행중</span><br>
						<span id="ing2">목표 금액인 ${prj[0].prjNo.prjGoal }원이 모여야만 결제됩니다.</span><br>
						<span id="ing2">결제는 ${prj[0].prjNo.endDate }에 다함께 진행됩니다.</span>
					</div>
				</aside>
			</div>
		</div>
			<span>목표 금액</span><br>
			<span>${prj[0].prjNo.prjGoal }원</span><br>
			<span>시작일:${prj[0].prjNo.startDate }</span><br> 
			<span>마감일:${prj[0].prjNo.endDate }</span><br>
			<span>결제일:${prj[0].prjNo.payDate }</span><br>
			<span>제작자 :${prj[0].prjNo.userNo.userName }</span>
			<progress value="${sum }" max="${prj[0].prjNo.prjGoal }"></progress>
			<span>달성률 : </span><br>
			<c:forEach var="prj" items="${prj }" varStatus="count">
				<fieldset class="optBox">
					<ul>
						<li>${prj.optName }:${prj.optContent }<span class="price"><c:out
									value="${prj.optPrice }원" /></span></li>
					</ul>
					<input class="resOptNo" type="hidden" value="${prj.optNo }" /> 
					<input class="resPrice" type="hidden" value="${prj.optPrice }" />
					<input type="hidden" value="${prj.optNo }" />
				</fieldset>
				<br>
			</c:forEach>
			<span class="resultPrice">가격 : 0원 </span>
			<form action="<%=request.getContextPath() %>/fundingProject" method="post" class="fundingForm">
				<c:if test="${sysYear>prj[0].prjNo.endDate}"><button disabled="disabled">후원 불가</button></c:if>
				<c:if test="${sysYear<=prj[0].prjNo.endDate}">
					<input class="fund" type="submit" value="후 원" >
				</c:if>
			</form>
			<div id="projectUserInfo">
				<jsp:include page="/WEB-INF/view/project/projectUserInfo.jsp" />
			</div>
			<div id="prjBoard">
				<c:if test="${empty prBoard}">
					<jsp:include page="/WEB-INF/view/prjBoard/prjBoard.jsp" />
				</c:if>
				<c:if test="${!empty prBoard}">
					<jsp:include page="/WEB-INF/view/prjBoard/prjBoard-detail.jsp" />
				</c:if>				
			</div>
		</div>	
</body>
</html>