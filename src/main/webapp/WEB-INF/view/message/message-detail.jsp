<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 메세지</title>
</head>
<body>
	<div class="container">
		<header>		   
			<jsp:include page="/WEB-INF/view/home/header_top.jsp"/> 
		</header>
		<section id="messageFormArea">
			<fieldset>
				<jsp:include page="/WEB-INF/view/message/message-menu.jsp"/>
			</fieldset>
			<h2>메세지</h2>	
			<fieldset>
			<form:form modelAttribute="message">
				<p>
					<label> 보내는사람 :
					<form:input path="sendUser" readonly="true" value="${message.sendUser}" /> 
					<form:errors path="sendUser" />
					</label>
				</p>
				<p>
					<label> 받는사람 :
					<form:input path="receiveUser" readonly="true" value="${message.receiveUser}"/> 
					<form:errors path="receiveUser" />
					</label>
				</p>
				<p>						
					<form:textarea path="msgContent" readonly="true" value="${message.msgContent}"/> 
					<form:errors path="msgContent" />						
				</p>
				<form:button type="button"  onclick="history.back(-1);">뒤로가기</form:button>					
			</form:form>
			</fieldset>		
		</section>
		<footer>
			<jsp:include page="/WEB-INF/view/home/footer.jsp"/> 
		</footer>		
	</div>
</body>
</html>