<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
			<meta charset="UTF-8">
			<title>계좌 등록</title>
					<link rel="stylesheet" href=" <%=request.getContextPath() %>/css/home_css/main.css">
					<link rel="stylesheet" href=" <%=request.getContextPath() %>/css/upload_css/register_bankaccount.css">
					<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
				<script type="text/javascript">			
				/* 뒤로 */
			$(function(){
				var contextPath = "<%=request.getContextPath()%>";
				$("#cancel").on("click", function(){
					window.location.href = contextPath+"/uploadMain";
				});			
			});		
</script>
					
</head>
<body>
${authInfo.userNo}
		<section class="container">
			<header id = "bankaccount" >		   
					<jsp:include page="/WEB-INF/view/home/header.jsp"/>
			</header>
				<h2>계좌등록</h2>
						<form  action= "<%=request.getContextPath() %>/registerBank/${authInfo.userNo}" method="post">
								<section id = "bankaccount_content">
										<table>
												<tbody>
															<tr class = "col1">
																	<td></td>
																	<td class="td_right"  colspan="2">
																			<input type="hidden" id="userNo" name="userNo" value="${authInfo.userNo}" 
																					size=49	required="required" readonly="readonly"/>																			
																	</td>					
															</tr>
															<tr class = "col2">
																	<td class="td_left"><label for="accountHolder">예금주</label></td>
																	<td class="td_right" >
																			<input type="text" id="accountHolder" name="accountHolder" 
																					size=21	required="required" />																								
																	</td>
															</tr>	
															<tr class = "col3">
																	<td class="td_left"><label for="bankName">은행명</label></td>
																	<td class="td_right" >
																			<select id = "bankName" name = "bankName">
																					<option value = "선택안함">----은행을 선택해주세요----</option>
																					<option value = "국민은행">국민은행</option>
																					<option value = "농협">농협</option>
																					<option value = "신한은행">신한은행</option>
																					<option value = "우리은행">우리은행</option>
																					<option value = "하나은행">하나은행</option>
																					<option value = "새마을금고">새마을금고</option>
																					<option value = "카카오뱅크">카카오뱅크</option>																			
																			</select>
																	</td>					
															</tr>
																<tr class = "col4">
																	<td class="td_left"><label for="bankAccount">계좌번호</label></td>
																	<td class="td_right" >
																			<input type="text" id="bankAccount" name="bankAccount" 
																					size=21	required="required" />																								
																	</td>
																</tr>											
												</tbody>
										</table>
								</section>						
											<div id = "btns">
													<input type="submit"  value="계좌등록"/>&nbsp;													
													<button id = "cancel">취소</button>																					
											</div>		
							</form>					
				<footer>
					<jsp:include page="/WEB-INF/view/home/footer.jsp"/>
			</footer>
	</section>
</body>
</html>