<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>register_secpage</title>
		<link rel="stylesheet" href=" <%=request.getContextPath() %>/css/upload_css/register_optinfo.css">
</head>
<body>
		<section id = "register_optcontent">
			<table>
					<tbody>
							<tr>
									<td class = "td_left">
											<label for = "optPrice">옵션이름</label>
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
											 <textarea id = "optContent" name = "optContent"	rows="11" cols="38" required="required"></textarea>
									</td>
							</tr>					
					</tbody>			
			</table>	
		</section>

</body>
</html>