<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/funding_css/fundingScreen.css"/>
</head>
<body>
<div>
	<h1>프로젝트 후원하기</h1>
		<div class="prjInfo">
			<img src="<%=request.getContextPath() %>/images/project/project${prj[0].prjNo.prjNo }.jpg" align="left" />
			<div class="divPrjInfo">
				<span>후원 프로젝트 : ${prjInfo.prjName }</span><br>
				<span>제작자 : ${prjInfo.prjManager }</span><br>
				<span><fmt:formatNumber value="${prjInfo.totalPrice }" pattern="#,###"/>원 </span> 
				<span class="achiRate">${prjInfo.totalPrice/prjInfo.prjGoal*100 }%</span>
			</div>
		</div>
</div>
<div>
	<h3>선물 정보</h3>
	<div class="giftInfo">
	<table border="1">
		<tr>
			<td rowspan="2" class="tdTitle">선물 구성</td>
			<td class="tdContent">${buyOption.optName}</td>
		</tr>
		<tr>
			<td class="tdContent">${buyOption.optContent }</td>
		</tr>
		<tr>
			<td class="tdTitle">선물금액</td>
			<td class="tdContent"><fmt:formatNumber value="${buyOption.optPrice }" pattern="#,###"/>원</td>
		</tr>
		<tr>
			<td class="tdTitle">예상 전달일</td>
			<td class="tdContent">${buyOption.prjNo.payDate }</td>
		</tr>
	</table>
	</div>
</div>
<div>
	<h3>후원자 정보</h3>
	<div>
	<table>
		<tr>
			<td>후원자</td>
			<td>${ui.userName }</td>
		</tr>
		<tr>
			<td>연락처</td>
			<td>
				<input type="text" name="phone" placeholder="휴대폰번호를 입력하세요!" />
				<input type="button" class="authConfig" value="본인 확인"/>
			</td>
		</tr>
		<tr><td>이메일</td>
		<td>${ui.email }</td></tr>
	</table>
	</div>
</div>
		
</body>
</html>