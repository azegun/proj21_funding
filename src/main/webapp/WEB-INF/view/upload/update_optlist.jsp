<%@ page language="java" contentType="text/html; charset=	UTF-8"   pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>옵션 리스트</title>		
				<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
				<link rel="stylesheet" href=" <%=request.getContextPath() %>/css/home_css/main.css">
				<link rel="stylesheet" href=" <%=request.getContextPath() %>/css/upload_css/update_opjlist.css">
</head>
<body>
${ project[0].optNo }
			<h2>옵션 수정</h2>	
			<section id = "upload_opjcontent">					
			<table>			
			<tbody>			
				<!-- <div id = "option1">	 -->								
							<tr>											
									<td class = "td_left">
											<label for = "optName">옵션이름</label>
									</td>									
									<td class = "td_right">
											 <input type="text" id = "optName" name = "optName" value = "${ project[0].optName }" size = 40 required="required"></input>
									</td>
								<td class = "td_right">
											 <input type="hidden" id = "optNo" name = "optNo" value= "${ project[0].optNo }" ></input>
									</td>
							</tr>
							<tr>
									<td class = "td_left">
											<label for = "optPrice">옵션금액</label>
									</td>
									<td class = "td_right">
											 <input type="text" id = "optPrice" name = "optPrice" value = "${ project[0].optPrice }"  size = 40 required="required"></input>
									</td>
							</tr>
							<tr>
									<td class = "td_left">
											<label for = "optContent">옵션내용</label>
									</td>
									<td class = "td_right">
											 <textarea id = "optContent" name = "optContent"	rows="11" cols="42" required="required">${ project[0].optContent }</textarea>
									</td>
							</tr>
						<!-- 	</div>
							<div id = "addOption"> -->
									<!--  <span id = "optionPlus">+</span>
									<span id = "optionMinus">-</span> -->
							<!-- </div> -->
							<!--  월요일에 열기-->
						<!-- 	<div id = "option2">
								<tr>
									<td class = "td_left">
											<label for = "addOptName">옵션이름</label>
									</td>
									<td class = "td_right">
											 <input type="text" id = "addOptName" name = "addOptName"  size = 40 ></input>
									</td>
							</tr>
							<tr>
									<td class = "td_left">
											<label for = "addOptPrice">옵션금액</label>
									</td>
									<td class = "td_right">
											 <input type="text" id = "addOptPrice" name = "addOptPrice"  size = 40 ></input>
									</td>
							</tr>
							<tr>
									<td class = "td_left">
											<label for = "addOptContent">옵션내용</label>
									</td>						
									<td class = "td_right">
											 <textarea id = "addOptContent" name = "addOptContent"	rows="11" cols="42" ></textarea>
									</td>
							</tr>			 -->
				</tbody>	
			</table>					
			</section>
</body>
</html>