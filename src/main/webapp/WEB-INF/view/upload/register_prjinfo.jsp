<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>Register mid</title>		
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<link rel="stylesheet" href=" <%=request.getContextPath() %>/css/upload_css/register_prjinfo.css">
</head>
<body>

	<h2>프로젝트 등록</h2>
		<section id = "register_prjcontent">							
			<table>			
			<tbody>
			
		<!-- 	<tr>
					<td class = "td_left">
							<label for = "prjNo">프로젝트 번호 </label>
					</td>
					<td class = "td_right" >
							<input type="text" id = "prjNo" name = "prjNo" size = 40 required="required" />readonly="readonly"
					</td>
			</tr> -->
			<tr>
					<td class = "td_left">
							<label for = "userNo" >프로젝트 관리자  </label>
					</td>
					<td class = "td_right">
							  <input type="text" id = "userNo" name = "userNo.userNo"  value ="${authInfo.userNo }"  size = 40   required="required"  readonly="readonly"/> 
					</td>
			</tr>
			<tr>
					<td class = "td_left">
							<label for = "prjName">프로젝트 명</label>
					</td>
					<td class = "td_right"	>
							  <input type="text" id = "prjName" name = "prjName" size = 40  required="required"/>
					</td>
			</tr>
			<tr>
					<td class = "td_left">
							<label for = "prjContent">프로젝트 내용</label>
					</td>
					<td class = "td_right">
							 <textarea id = "prjContent" name = "prjContent"   rows="15" cols="38" required="required"></textarea>
					</td>
			</tr>
			<tr>
					<td class = "td_left">
							<label for = "prjGoal">목표금액</label>
					</td>
					<td class = "td_right">
							 <input type="text" id = "prjGoal" name = "prjGoal" size = 40 required="required"></input>
					</td>
			</tr>
			<!-- <tr>
					<td class = "td_left">
							<label for = "startDate">시작일</label>
					</td>
					<td class = "td_right">
							 <input type="date" id = "startDate" name = "startDate"  required="required"></input>
					</td>
			</tr> -->
			<tr>
					<td class = "td_left">
							<label for = "endDate">마감일</label>
					</td>
					<td class = "td_right">
							 <input type="date" id = "endDate" name = "endDate" required="required" ></input>
					</td>
			</tr>
			<tr>
					<td class = "td_left">
							<label for = "payDate">결제일</label>
					</td>
					<td class = "td_right">
							 <input type="date" id = "payDate" name = "payDate"  required="required"></input>
					</td>
			</tr>
			
			</tbody>	
			</table>				
		</section>
		
</body>
</html>