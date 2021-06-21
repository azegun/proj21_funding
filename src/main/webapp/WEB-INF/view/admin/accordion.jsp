<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="/proj21_funding/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/proj21_funding/bootstrap/css/bootstrap-theme.min.css">
<script type="text/javascript" src="/proj21_funding/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<div id="page-wrapper">

  <!-- 본문 -->
  <div id="page-content-wrapper">
   		<div class="container-fluid">
    	
    	<h1>회원관리</h1>
<table class="table table-striped table-bordered table-hover">
<thead>
     <tr>
		    	 <th class="col-md-1 text-center">회원번호</th>
		    	 <th class="col-md-1 text-center">회원계정</th>
		    	 <th class="col-md-1 text-center">회원성명</th>
		    	 <th class="col-md-1 text-center">회원별명</th>
		    	 <th class="col-md-2 text-center">회원H.P</th>
		    	 <th class="col-md-1 text-center">우편번호</th>
		    	 <th class="col-md-4 text-center">주소</th>
		    	 <th class="col-md-1 text-center">탈퇴여부</th>
	    	 </tr>
</thead>

<tbody>
 	<c:forEach var="user" items="${userList }" varStatus="status">
    <tr data-toggle="collapse" data-target="#accordion${status.index }" class="text-center clickable">
        <td>${user.userNo} </td>
		    	 <td>${user.userId } </td>
		    	 <td>${user.userName } </td>
		    	 <td>${user.nickName } </td>
		    	 <td>${user.userPhone } </td>
		    	 <td>${user.zipCode } </td>
		    	 <td>${user.address } ${user.detailAddress } </td>
		    	 <td>
			    	 <c:if test ="${user.secession == true }">탈퇴</c:if>
			    	 <c:if test ="${user.secession != true }">회원</c:if>
		    	 </td>
    </tr>
    <tr>
        <td colspan="8">
            <div id="accordion${status.index }" class="collapse">Hidden by default</div>
        </td>
    </tr>
     </c:forEach>
</tbody>
</table>
		
   		</div>
	</div>
</div>
</body>
</html>