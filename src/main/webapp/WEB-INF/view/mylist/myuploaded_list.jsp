<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>등록된 리스트</title>
			<link rel="stylesheet" href=" <%=request.getContextPath() %>/css/home_css/main.css">
						<link rel="stylesheet" href=" <%=request.getContextPath() %>/css/mylist.css/myuploaded_list.css">
			
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script type="text/javascript">
	function checkAll(theForm){
		if(theForm.remove.length == undefined){
			theForm.remove.checked = theForm.allCheck.checked;
		}else{
			for(var i =0; i <theForm.remove.length; i++){
				theForm.remove[i].checked = theForm.allCheck.checked;
			}
		}
	}
</script>
</head>
<body>
${authInfo }
	<section class="container">
		<header>		   
				<jsp:include page="/WEB-INF/view/home/header.jsp"/>
		</header>
		<section id= "table_all">
		<table border= 1>		
			<thead id = "column">
				<tr>
						<th>
						<input type = "checkbox" id = "allCheck" name = "allCheck" onclick="checkAll(this.form)"/>
						</th>
						<th>번호</th>
						<th>프로젝트</th>
						<th>소개</th>
						<th>목표 금액</th>
						<th>시작일</th>
						<th>마감일</th>
						<th>결제일</th>
						<th>옵션이름</th>
						<th>옵션금액</th>
						<th>옵션내용</th>
						<th>진행상황</th>
				</tr>
			</thead>
			<tbody id= "context">			
				<tr> 
						<td>
						<input type = "checkbox" id = "remove" name = "remove"  value =  />
						</td>
							<%-- <td>${project.pNo }</td>
							<td>${project.pName }</td>
							<td>${project.pContent }</td>
							<td>${project.pGoal}</td>
							<td>${project.eDate }</td>
							<td>${project.pDate }</td>
							<td>${project.oName }</td>
							<td>${project.oPrice }</td>
							<td>${project.oContent }</td> --%>
				</tr>
				</tbody>
		</table>
		</section>
				<div id ="foot_btn">
						<button id = "go_main">메인</button>&nbsp;
				</div>
		<footer>
			<jsp:include page="/WEB-INF/view/home/footer.jsp"/>
		</footer>
	</section>


</body>
</html>