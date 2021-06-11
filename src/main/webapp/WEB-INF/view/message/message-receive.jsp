<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>받은 메세지함</title>
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
			<h2>받은 메세지(${fn:length(messages)})</h2>
			<form:form modelAttribute="message" action="dels">						
			<fieldset>
				<table>
					<tr>
						<th><input type="checkbox" id="checkAll"/></th>										
						<th>발신자</th>						
						<th>내용</th>
						<th>발신일</th>						
					</tr>					
					<c:forEach var="msg" items="${messages}">
						<tr>						
							<td><form:checkbox path="check" value="${msg.msgNo}"/></td>		
							<td><a href="<c:url value="/message/message-receive/${msg.msgNo}" />">${msg.sendUser}</a></td>		
							<td><a href="<c:url value="/message/message-receive/${msg.msgNo}" />">${msg.msgContent}</a></td>							
							<td><tf:formatDateTime value="${msg.sendDate}" pattern="yyyy-MM-dd" /></td>																			
						</tr>
					</c:forEach>								
				</table>
			</fieldset>	
			<button>삭제</button>
			</form:form>					
		</section>
		<footer>
			<jsp:include page="/WEB-INF/view/home/footer.jsp"/> 
		</footer>		
	</div>
</body>
</html>