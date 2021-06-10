<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의하기 | 고객센터</title>
<link rel="stylesheet" href="/proj21_funding/css/servicecenter_write.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/home_css/main.css">
</head>
<body>
<%=request.getContextPath() %>
	<section class="container">
		<header>		   
			<jsp:include page="/WEB-INF/view/home/header_top.jsp"/> 
			<jsp:include page="/WEB-INF/view/home/header_account.jsp"/> 
		</header>
	<section class = "sevicecenter_write">
	<h2>문의하기</h2>
	<form action="<%=request.getContextPath() %>/qnaSuccess" method="post">
		<table>
				<tr>
					<td class="td_left"><label for="categoryNo">분류</label></td>
					<td class="td_right">
						<select>
							<option value="창작자">창작자 관련</option>
							<option value="후원자">후원자 관련</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="td_left"><label for="userName">작성자</label></td>
					<td class="td_right" id = "userName" name = "userNo.userName"  value ="${authInfo.userNo }" size = 40   required="required"  readonly="readonly"></td>
				</tr>
				<tr>
					<td class="td_left"><label for="qnaTitle">제목</label></td>
					<td class="td_right"> <input type="text" name="qnaTitle" id="qnaTitle" required="required"></td>
				</tr>
				<tr>
					<td class="td_left"><label for="qnaContent">내용</label></td>
					<td class="td_right"> <textarea name="qnaContent" id="qnaContent" cols="40" rows="15" required="required"></textarea></td>
				</tr>
				<tr>
					<td class="td_left"><label for="qnaFile">파일첨부</label></td>
					<td class="td_right"> <input type="file" name="qnaFile" id="qnaFile"></input></td>
				</tr>
		</table>
		<section id="commandCell">
			<input type="submit" value="등록">&nbsp;&nbsp;
			<input type="reset" value="다시쓰기">
			<button id="go_qna">돌아가기</button>
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