<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메세지</title>
<script type="text/javascript">
	function openSearch(){		
		window.open('message-search', '', 'left = 500, top = 150, width = 1000, height = 700')
	}
</script>
</head>
<body>
	<div class="container">
		<header>		   
			<jsp:include page="/WEB-INF/view/home/header_top.jsp"/> 
		</header>
		<section id="messageFormArea">		
			<fieldset id="menu">
				<jsp:include page="/WEB-INF/view/message/message-menu.jsp"/>
			</fieldset>
			<h2>메세지 보내기</h2>		
			<form:form modelAttribute="message">	
			<form:errors />
				<fieldset>
					<p>
						<label> 보내는사람 :
						<form:input path="sendUser" readonly="true" value="${authInfo.userId}" /> 
						<form:errors path="sendUser" />
						</label>
					</p>
					<p>
						<label> 받는사람 : ${receive[1]}
						<form:input path="receiveUser" id="receiveUser" value=""/> 
						<form:errors path="receiveUser" />
						<form:button type="button" onclick="openSearch()">검색</form:button>
						</label>
					</p>
					<p>						
						<form:textarea path="msgContent"  cols="40" rows="15" /> 
						<form:errors path="msgContent" />						
					</p>
					<form:button id="submit">보내기</form:button>
					<form:button type ="reset">다시쓰기</form:button>
				</fieldset>	
			</form:form>		
		</section>
		<footer>
			<jsp:include page="/WEB-INF/view/home/footer.jsp"/> 
		</footer>		
	</div>
</body>
</html>