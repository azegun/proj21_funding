<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>Register mid</title>		
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<link rel="stylesheet" href=" <%=request.getContextPath() %>/css/upload_css/register_mid.css">
</head>
<body>
	<h2>프로젝트 등록</h2>
		<section id = "register_content">					
			<form action="" method="post" name = "registerPrjForm">
			<table>			
			<tbody>
			<tr>
					<td class = "td_left">
							<label for = "prjNo">프로젝트 번호 </label>
					</td>
					<td class = "td_right" >
							<input type="text" id = "prjNo" name = "prjNo" size = 40 required="required" readonly="readonly"/>
					</td>
			</tr>
			<tr>
					<td class = "td_left">
							<label for = "userNo" >프로젝트 관리자  </label>
					</td>
					<td class = "td_right" width="" >
							  <input type="text" id = "userNo" name = "userNo"  size = 40   required="required"  readonly="readonly"/>
					</td>
			</tr>
			<tr>
					<td class = "td_left">
							<label for = "userNo">프로젝트 명</label>
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
			<tr>
					<td class = "td_left">
							<label for = "startDate">시작일</label>
					</td>
					<td class = "td_right">
							 <input type="date" id = "startDate" name = "startDate"  required="required"></input>
					</td>
			</tr>
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
							 <textarea id = "optContent" name = "optContent"	rows="7" cols="38" required="required"></textarea>
					</td>
			</tr>
			</tbody>
			<tfoot>
					<tr>
						<td colspan="2" id="register_btns">
							<input type="submit" value="등록"/>&nbsp;&nbsp; 
							<input type="reset" value="다시쓰기" />&nbsp;&nbsp; 
							<button id = "go_info" >취소</button>
						</td>
					</tr>			
			</tfoot>
			</table>
			</form>				
		</section>
		
</body>
</html>