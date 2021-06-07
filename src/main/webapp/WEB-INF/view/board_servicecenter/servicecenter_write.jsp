<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의하기 | 고객센터</title>
<link rel="stylesheet" href="/proj21_funding/css/servicecenter_write.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/home_css/main.css">
</head>
<body>
	<section class="container">
		<header>		   
			<jsp:include page="/WEB-INF/view/home/header_top.jsp"/> 
			<jsp:include page="/WEB-INF/view/home/header_account.jsp"/> 
		</header>
	<section class = "sevicecenter_write">
	<h2>문의하기</h2>
	<form action="#">
		<table>
				<tr>
					<td class="td_left"><label for="qna_category">분류</label></td>
					<td class="td_right">
						<select>
							<option value="creater">창작자 관련</option>
							<option value="sponsor">후원자 관련</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="td_left"><label for="qna_subject">제목</label></td>
					<td class="td_right"> <input type="text" name="qna_subject" id="qna_subject" required="required"></td>
				</tr>
				<tr>
					<td class="td_left"><label for="qna_content">내용</label></td>
					<td class="td_right"> <textarea name="qna_content" id="qna_content" cols="40" rows="15" required="required"></textarea></td>
				</tr>
				<tr>
					<td class="td_left"><label for="qna_file">파일첨부</label></td>
					<td class="td_right"> <input type="file" name="qna_content" id="qna_file" required="required"></input></td>
				</tr>
		</table>
		<section id="commandCell">
			<input type="submit" value="등록">&nbsp;&nbsp;
			<input type="reset" value="다시쓰기">
		</section>
			</form>
		</section>
		<footer>
			<jsp:include page="/WEB-INF/view/home/footer_menu.jsp"/> 
			<jsp:include page="/WEB-INF/view/home/footer_info.jsp"/> 
		</footer>		

	
	</section>
</body>
</html>