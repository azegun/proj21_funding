<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/prjBoard_css/prjBoard.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"  ></script>
<script type="text/javascript">
	$(document).ready(function(){   
	    $('ul.tabs li').click(function(){
	       var tab_id = $(this).attr('data-tab');
	
	    $('ul.tabs li').removeClass('current');
	    $('.board_mid').removeClass('current');
	
	    $(this).addClass('current');
	    $("#"+tab_id).addClass('current');
	 }); 
	});

	function openWrite(){		
		window.open('<%=request.getContextPath()%>/prjBoard/prjBoard-write', '', 'left = 600, top = 150, width = 500, height = 500');
	};
</script>
</head>
<body>
	<fieldset id="prjBoardArea">		
		<section>	
			<fieldset>
				<c:choose>
					<c:when test="${!empty info}">			
						<button onclick="openWrite()" value="${prjNo}">글쓰기</button>
					</c:when>
					<c:when test="${prj[0].prjNo.userNo.userNo eq authInfo.userNo}">			
						<button onclick="openWrite()" value="${prjNo}">글쓰기</button>
					</c:when>
					<c:otherwise>
						후원자만 글을 쓸 수 있습니다.
					</c:otherwise>
				</c:choose>				
			</fieldset>
							
			<section class="container_tab">
				<ul class="tabs">
					<li class="tab-link current"  id = "tab-click" data-tab="tab-1">모든 게시물 보기</li>
					<li class="tab-link"   id = "tab-click2" data-tab="tab-2">창작자 작성 게시물</li>
				</ul>
				
				<div id="tab-1" class="board_mid current">
					<h2>모든 게시물 보기</h2>
					<c:forEach  var="board" items="${board}" varStatus="status">				
						<fieldset>
						<c:if test="${prj[0].prjNo.userNo.userNo eq board.userNo.userNo}">
							<div>  창작자   </div>
						</c:if>				
							<div id="nickName">${board.userNo.nickName}</div>				
							<div id="postDate"><tf:formatDateTime value="${board.postDate}" pattern="yyyy-MM-dd" /></div>				
							<c:if test="${!empty board.postFile}">					
								<div id="postFile"><a href="<c:url value="/prjBoard/prjBoard-detail/${board.postNo}" />"><img src="data:image/jpeg;base64,${img[status.index]}" alt="img"></a></div>	
							</c:if>
							<div id="postContent"><a href="<c:url value="/prjBoard/prjBoard-detail/${board.postNo}" />">${board.postContent}</a></div>
						</fieldset>	
					</c:forEach>
				</div>
			
				<div id="tab-2" class="board_mid">
					<h2>창작자 작성 게시물</h2>						
					<c:forEach  var="board" items="${board}" varStatus="status">				
						<c:if test="${prj[0].prjNo.userNo.userNo eq board.userNo.userNo}">
							<fieldset>						
								<div>  창작자   </div>									
								<div id="nickName">${board.userNo.nickName}</div>				
								<div id="postDate"><tf:formatDateTime value="${board.postDate}" pattern="yyyy-MM-dd" /></div>				
								<c:if test="${!empty board.postFile}">					
									<div id="postFile"><a href="<c:url value="/prjBoard/prjBoard-detail/${board.postNo}" />"><img src="data:image/jpeg;base64,${img[status.index]}" alt="img"></a></div>	
								</c:if>
								<div id="postContent"><a href="<c:url value="/prjBoard/prjBoard-detail/${board.postNo}" />">${board.postContent}</a></div>
							</fieldset>	
						</c:if>	
					</c:forEach>
				</div>
				
			</section>			
		</section>
	</fieldset>
</body>
</html>