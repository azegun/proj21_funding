<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>register_secpage</title>
		<link rel="stylesheet" href=" <%=request.getContextPath() %>/css/upload_css/register_optinfo.css">
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		
		
</head>
<body>
		<section id = "register_optcontent">
			<table>
					<tbody>
						<div id = "option1">			
							<tr>											
									<td class = "td_left">
											<label for = "optName">옵션이름</label>
									</td>
									<td class = "td_right">
											 <input type="text" id = "optName" name = "optName"  size = 40 required="required"></input>
									</td>
							</tr>
							<tr>
									<td class = "td_left">
											<label for = "optPrice">옵션금액</label>
									</td>
									<td class = "td_right">
											 <input type="text" id = "optPrice" name = "optPrice"  size = 40 required="required"></input>
									</td>
							</tr>
							<tr>
									<td class = "td_left">
											<label for = "optContent">옵션내용</label>
									</td>
									<td class = "td_right">
											 <textarea id = "optContent" name = "optContent"	rows="11" cols="42" required="required"></textarea>
									</td>
							</tr>
							</div>
							<div id = "addOption">
									<button id = "optionPlus">+</button>
									<button id = "optionMinus">-</button>
							</div>
							<div id = "option2">
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
							</tr>			
						</div>					
					</tbody>			
			</table>	
		</section>

</body>
</html>