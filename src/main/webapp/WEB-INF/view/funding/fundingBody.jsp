<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/funding_css/fundingScreen.css"/>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"> </script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
 function execDaumPostCode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }


                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("zip").value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAdd").focus();
            }
        }).open();
 }
</script>
<script>
	$(function(){
		
		/* 후원자정보 본인 확인 메소드 */
		$(".btnConfig").click(function(){
			var textPhoneNo=$(".textPhoneNo").val()
			console.log(textPhoneNo)
			var phoneNo=$(".phoneNo").val()
			console.log(phoneNo)
			if (textPhoneNo == phoneNo){
				$(".authCheck").attr("value","1")
				$(".btnConfig").attr("disabled","disabled")
				$(".textPhoneNo").attr("readonly","readonly")
				$(".checkText").text("본인확인을 완료했습니다.")
			} else {
				alert('휴대폰번호가 일치하지않습니다.')
				$(".authCheck").attr("value","0")

			}
		})
		
		/* 배송지 선택 라디오버튼 메소드 */
		$('input:radio[name=address]').click(function(){
			if($('input:radio[name=address]:checked').val() == 'base'){
				$("#zip").val('${ui.zipCode }')
				$("#address").val('${ui.address}')
				$("#detailAdd").val('${ui.detailAddress}')
				$("#btnAdd").attr("disabled", true)
			} else {
				$("#zip").val('').attr("readonly","false")
				$("#address").val('').attr("readonly","false")
				$("#detailAdd").val('').attr("readonly","false")
				$("#detailAdd").attr("readonly",false)
				$("#btnAdd").attr("disabled", false)
			}
		})
		
		/* 결제방법 라디오버튼 메소드 */
		$('input:radio[name=payMethod]').click(function(){
			if($('input:radio[name=payMethod]:checked').val() == 'card'){
				$('#payText').text("카드 번호 ")
			} else {
				$('#payText').text("계좌 번호 ")
				
			}
		})
		
		
		/* 후원하기 버튼 클릭시 실행 메소드  */
		$('.btnSubmit').click(function(){
			if($('.authCheck').val() == '1'){
				console.log(1)
				$('.btnSubmit').attr("type","submit")
				$('.btnSubmit').one('click',function(){})
			} else {
				alert('정보를 모두 입력해 주세요')
			}
		})
	})
</script>
</head>
<body>
<div>
	<h1>프로젝트 후원하기</h1>
		<div class="prjInfo">
			<img src="<%=request.getContextPath() %>/images/project/project${prj[0].prjNo.prjNo }.jpg" align="left" />
			<div class="divPrjInfo">
				<span>후원 프로젝트 : ${prjInfo.prjName }</span><br>
				<span>제작자 : ${prjInfo.prjManager }</span><br>
				<span><fmt:formatNumber value="${prjInfo.totalPrice }" pattern="#,###"/>원 </span> 
				<span class="achiRate">${prjInfo.totalPrice/prjInfo.prjGoal*100 }%</span>
			</div>
		</div>
</div>
<form  class="fundingForm" action="fundingSuccess/${ui.userNo }/${buyOption.optNo}" method="post">
	<div>
		<h3>선물 정보</h3>
		<div class="giftInfo">
		<table border="1">
			<tr>
				<td rowspan="2" class="tdTitle">선물 구성</td>
				<td class="tdContent">${buyOption.optName}</td>
			</tr>
			<tr>
				<td class="tdContent">${buyOption.optContent }</td>
			</tr>
			<tr>
				<td class="tdTitle">선물금액</td>
				<td class="tdContent"><fmt:formatNumber value="${buyOption.optPrice }" pattern="#,###"/>원</td>
			</tr>
			<tr>
				<td class="tdTitle">예상 전달일</td>
				<td class="tdContent">${buyOption.prjNo.payDate }</td>
			</tr>
		</table>
		</div>
	</div>
	<div>
		<h3>후원자 정보</h3>
		<div>
		<table>
			<tr>
				<td>후원자</td>
				<td>${ui.userName }</td>
			</tr>
			<tr>
				<td>연락처</td>
				<td>
					<input type="text" class="textPhoneNo" placeholder="휴대폰번호를 입력하세요!" />
					<input type="hidden" class="phoneNo" value="${ui.userPhone }"/>
					<input type="button" class="btnConfig" value="본인 확인">
					<span class="checkText">본인 확인이 필요합니다.</span>
					<input type="hidden" class="authCheck" value="0"/>
				</td>
			</tr>
			<tr><td>이메일</td>
			<td>${ui.email }</td></tr>
		</table>
		</div>
	</div>
	<div>
		<h3>배송지 정보</h3>
		<label><input type="radio" class="baseAdd" name="address" value="base" checked/>기본 배송지</label>
		<label><input type="radio" class="newAdd" name="address" value="new"/>새로운 배송지</label><br>
		
		<input type="text" id="zip" value="${ui.zipCode }" name="zipCode" readonly="readonly"/> 
		<input type="button" id="btnAdd" onclick="execDaumPostCode()" value="우편번호 찾기"  disabled="disabled"/> <br>
		<input type="text" id="address" value="${ui.address }" name="address" readonly="readonly"/> 
		<input type="text" id="detailAdd" value="${ui.detailAddress }" name="detailAddress" readonly="readonly"/> <br>
	</div>
	<div>
		<h3>결제 정보</h3>
		<label><input type="radio" class="payCard" name="payMethod" value="card" checked/>신용카드/체크카드</label>
		<label><input type="radio" class="payBank" name="payMethod" value="bank"/>계좌이체</label><br>
		
		<span id="payText">카드 번호 </span><input type="text" id="textNo" name="accountNo" />
	</div>
	<input type="hidden" name="prjNo" value="${prjInfo.prjNo }"/>
	<input type="hidden" name="userNo" value="${ui.userNo }"/>
	<input type="hidden" name="optNo" value="${buyOption.optNo }"/>
	<input type="button" class="btnSubmit" value="후원하기"/>
</form>
</body>
</html>