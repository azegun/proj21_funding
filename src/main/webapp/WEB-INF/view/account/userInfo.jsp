<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보관리</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/home_css/header.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/account_css/userInfo.css">
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
		<section id="userInfoArea">
			<h1>회원정보</h1>
			<form:form modelAttribute="userInfo">
			<form:errors />
				<p>
					<label>아이디:
					<form:input path="userId" readonly="true" />
					<form:errors path="userId" />
					</label>
				</p>
				<p>
					<label>비밀번호:
					<a href="<c:url value='/account/UserchangePw'/>">비밀번호 변경</a>
					</label>
				</p>
				<p>
					<label> 회원성명 :
					<form:input path="userName" /> 
					<form:errors path="userName" />
					</label>
				</p>
				<p>
					<label> 우편번호로 검색하기 :
					<form:input path="address" id="member_post"  readonly="true" onclick="findAddr()"/>					 
					<form:errors path="address" />										
					</label>
				</p>
				<p>
					<label> 주소 :
					<form:input path="address" id="member_addr" readonly="true" /> 
					<form:errors path="address" />					
					</label>
				</p>
				<p>
					<label> 상세주소 :
					<form:input path="detailAddress" readonly="true"/> 
					<form:errors path="detailAddress" />					
					</label>
				</p>				
				<p>
					<label> 회원H.P :
					<form:input path="userPhone" readonly="true"/> 
					<form:errors path="userPhone" />
					</label>
				</p>
				<p>
					<label> 이메일 :
					<form:input path="email" readonly="true"/> 
					<form:errors path="email" />
					</label>
				</p>
				<p>
					<label> 계좌번호 :
					<form:input path="bankAccount" readonly="true"/> 									
					<form:errors path="bankAccount" />
					</label>
				</p>
				<p>
					<label> 은행명 :
					<form:input path="bankName" readonly="true"/> 
					<form:errors path="bankName" />
					</label>
				</p>			
			</form:form>
		</section>
		<a href="#"><button>탈퇴하기</button></a>
		<footer>
			<jsp:include page="/WEB-INF/view/home/footer.jsp"/> 
		</footer>		
	</div>
</body>
</html>