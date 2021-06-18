<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 찾기</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#checkAll").click(function(){
			if($("#checkAll").prop("checked")) {
				$("input[type=checkbox]").prop("checked",true); 
			} else { 
				$("input[type=checkbox]").prop("checked",false);
			}
		});		
	});	
	
	function setReceive(){
		var select = eval("document.selectform");
		var checked = document.getElementsByName("check");
		var chkList = "";
		
		for(var i=0; i<checked.length; i++) {
			if(checked[i].checked == true){
				chkList += checked[i].value+", ";
			}			
		}	
		opener.document.getElementById("receiveUser").value = chkList;
		window.close(); 
	};
	
	
</script>
</head>
<body>	
		<div>
			<h2>진행중인 프로젝트</h2>
			<fieldset>
				<c:if test="${!empty projects}">
					<c:forEach var="pro" items="${projects}">					
						<a href="<c:url value="/message/message-search/${pro.prjNo}" />">${pro.prjNo}</a><br>
					</c:forEach>
				</c:if>	
				<c:if test="${empty projects}">
					없음
				</c:if>						
			</fieldset>
		</div>		
		<div>
			<h2>후원참여중인 회원</h2>
			<fieldset>		
				<table>
					<tr>
						<th><input type="checkbox" id="checkAll"/></th>										
						<th>회원번호</th>						
						<th>회원아이디</th>						
						<th>회원닉네임</th>												
					</tr>		
					<c:forEach var="funding" items="${fundingInfos}">									
						<tr>
							<td><input type="checkbox" value="${funding.userNo.userId}" id="check" name="check"></td>
							<td>${funding.userNo.userNo}&nbsp;&nbsp;</td>					
							<td>${funding.userNo.userId}&nbsp;&nbsp;</td>					
							<td>${funding.userNo.nickName}</td>							
						</tr>									
					</c:forEach>
				</table>			
			</fieldset>
		</div>		
		<input type="button" value="선택하기" onclick="setReceive()">	
</body>
</html>