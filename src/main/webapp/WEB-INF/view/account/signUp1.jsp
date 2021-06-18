<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/account_css/signUp1.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/home_css/main.css">
	<script type="text/javascript">
	function findAddr(){
		new daum.Postcode({
	        oncomplete: function(data) {        	
	        	console.log(data);        	
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var roadAddr = data.roadAddress; // 도로명 주소 변수
	            var jibunAddr = data.jibunAddress; // 지번 주소 변수
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('member_post').value = data.zonecode;
	            if(roadAddr !== ''){
	                document.getElementById("member_addr").value = roadAddr;
	            } 
	            else if(jibunAddr !== ''){
	                document.getElementById("member_addr").value = jibunAddr;
	            }
	        }
	    }).open();
	}
	</script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	<div class="container">
		<header>		   
			<jsp:include page="/WEB-INF/view/home/header_top.jsp"/> 
		</header>
		<section id="signUpForm">
			<h2>회원 가입</h2>		
			<form:form action="signUp2" modelAttribute="userSignUp">	
			<form:errors />		
			<fieldset id="signForm">
				<p><label> 회원계정 :
					<form:input path="userId" placeholder="4글자 이상 입력하세요" />					
					<form:errors path="userId" id="errors"/>
					</label>
				</p>
								
				<p><label> 비밀번호 :
					<form:password path="userPw" placeholder="4자리 이상 입력하세요"/>
					<form:errors path="userPw"  id="errors"/>
					</label>
				</p>				
				<p>
					<label> 비밀번호확인 :
					<form:password path="confirmUserPw" placeholder="4자리 이상 입력하세요" /> 
					<form:errors path="confirmUserPw" id="errors"/>
					</label>
				</p>
				<p>
					<label> 회원성명 :
					<form:input path="userName" /> 
					<form:errors path="userName" id="errors"/>
					</label>
				</p>
				<p>
					<label> 회원별명 :
					<form:input path="nickName" /> 
					<form:errors path="nickName" id="errors"/>
					</label>
				</p>
				<p>
					<label> 이메일 :
					<form:input path="email" /> 
					<form:errors path="email" id="errors"/>
					</label>
				</p>			
				<p>
					<label> 우편번호 검색하기 :
					<form:input path="zipCode" id="member_post" placeholder="클릭하세요" readonly="true" onclick="findAddr()" /> 
					<form:errors path="zipCode" id="errors"/>					
					</label>
				</p>
				<p>
					<label> 주소 :
					<form:input path="address" id="member_addr" readonly="true" />
					<form:errors path="address" id="errors"/>					
					</label>
				</p>
				<p>
					<label> 상세주소 :
					<form:input path="detailAddress" placeholder="상세주소를 입력하세요" /> 
					<form:errors path="detailAddress" />					
					</label>
				</p>				
				<p>
					<label> 회원H.P :
					<form:input path="userPhone" /> 
					<form:errors path="userPhone" id="errors"/>
					</label>
				</p>
				<p>
					<label> 은행명 :
					<form:input path="bankName" /> 
					<form:errors path="bankName" />
					</label>
				</p>	
				<p>
					<label> 계좌번호 :
					<form:input path="bankAccount" /> 									
					<form:errors path="bankAccount" />
					</label>
				</p>
									
				<P>이용약관에 모두 동의 합니다.
				<form:checkbox path="agree" value="true"/>				
				<a href="#" id="Terms">
				<form:button type="button">보기</form:button></a>
				<form:errors path="agree" id="errors"/>		
				</p>
				<form:button id="submit">가입하기</form:button>
			</fieldset>			
			</form:form>
		</section>		
	</div>
</body>
</html>