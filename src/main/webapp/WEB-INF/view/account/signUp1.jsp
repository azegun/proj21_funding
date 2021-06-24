<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/home_css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/account_css/signUp1.css">
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
		<section id="signUpArea">
			<h2>회원 가입</h2>		
			<form:form action="signUp2" modelAttribute="userSignUp">	
			<form:errors />		
			<fieldset id="signUpForm">
				<p>
					<label >회 원 계 정</label>:
					<form:input path="userId" placeholder="4글자 이상 입력하세요" />
				</p>					
				<p id="errors"><form:errors path="userId"/>&nbsp;</p>
				<p>
					<label>비밀번호입력 </label>:
					<form:password path="userPw" placeholder="4자리 이상 입력하세요"/>
				</p>	
				<p id="errors"><form:errors path="userPw"/>&nbsp;</p>				
				<p>
					<label>비밀번호확인</label>:
					<form:password path="confirmUserPw" placeholder="4자리 이상 입력하세요" />
				</p>				
				<p id="errors"><form:errors path="confirmUserPw"/>&nbsp;</p>
				<p>
					<label>회 원 성 명</label>:
					<form:input path="userName" /> 
				</p>
				<p id="errors"><form:errors path="userName"/>&nbsp;</p>				
				<p>
					<label>회 원 별 명</label>:
					<form:input path="nickName"/>
				</p> 
				<p id="errors"><form:errors path="nickName"/>&nbsp;</p>
				<p>
					<label> 이 메 일 </label>:
					<form:input path="email"/>
				</p> 
				<p id="errors"><form:errors path="email"/>&nbsp;</p>
				<p>
					<label>회 원 H.P</label>:
					<form:input path="userPhone" />
				</p>		 
				<p id="errors">&nbsp;</p>						
				<p>
					<label>우 편 번 호</label>:
					<form:input path="zipCode" id="member_post" placeholder="클릭하세요" readonly="true" /> 
					<form:button type="button" onclick="findAddr()">검색</form:button>
				</p>
				<p id="errors">&nbsp;</p>					
				<p>
					<label>주  소</label>:
					<form:input path="address" id="member_addr" readonly="true" />
				</p>
				<p id="errors"><form:errors path="address"/>&nbsp;</p>					
				<p>
					<label>상 세 주 소</label>:
					<form:input path="detailAddress" placeholder="상세주소를 입력하세요" />
				</p>		 
				<p id="errors">&nbsp;</p>								
				<p>
					<label>은 행 명</label>:
					<form:input path="bankName" />
				</p>
				<p id="errors">&nbsp;</p>
				<p>
					<label>예 금 주</label>:
					<form:input path="accountHolder" />
				</p>
				<p id="errors">&nbsp;</p>	
				<p>
					<label>계 좌 번 호</label>:
					<form:input path="bankAccount" />
				</p>
				<p id="errors">&nbsp;</p>									
				<P id="Terms">이용약관에 모두 동의 합니다.
					<form:checkbox path="agree" value="true"/>				
					<a href="#"><form:button type="button">보기</form:button></a>
				</p>
				<p id="agreeEerrors"><form:errors path="agree"/>&nbsp;</p>							
				<form:button id="submit">회 원 가 입</form:button>
			</fieldset>			
			</form:form>
		</section>		
	</div>
</body>
</html>