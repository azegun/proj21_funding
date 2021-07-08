<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"  ></script>
<script type="text/javascript">
	function modifyBoard(){		
	}
	function deleteBoard(){		
	}
	function registerReply(){
		var postNo = $('#postNo').val();		
		var replyContent = $('#registerReply').val();	
		var contextPath = "${contextPath}"
		 if(postNo.length == 0 || replyContent.length == 0){             
             alert("답변을 입력하세요");
             return;             
         }
		 
		 $.ajax({             
             url : "/registerReply",
             type : "POST",
             contentType : "application/json; charset=utf-8",                           
              data : JSON.stringify({ 
            	 postNo : postNo,
            	 replyContent : replyContent
             }),             
             success : function(){
                 alert("등록되었습니다.");
                 //폼 초기화
                 $('#registerReply').val('');
             },
             error : function(err){
            	 alert("실패했습니다.");
            	 alert(err);            	
                 console.log(err)
                 console.log(url)
                 console.log(data)                 
             }
         });

	}
	function modifyReply(){		
	}
	function deleteReply(){		
	}	
</script>
</head>
<body>
	<fieldset id="prjBoardDetailArea">
	<button type="button" onclick="history.back(-1);">다른 게시글 보기</button>
		<section>
			<div><input type="hidden" id="postNo" value="${prjBoard.postNo}"></div>
			<div id="nickName">${prjBoard.userNo.nickName}</div>				
			<div id="postDate"><tf:formatDateTime value="${prjBoard.postDate}" pattern="yyyy-MM-dd" /></div>				
			<c:if test="${!empty prjBoard.postFile}">					
				<div id="postFile"><img src="data:image/jpeg;base64,${img}" alt="img"></div>	
			</c:if>
			<div id="postContent">${prjBoard.postContent}</div>
		</section>
		<div id="btn">	
					<button type="button" onclick="modifyBoard()">수정</button>
					<button type="button" onclick="deleteBoard()">삭제</button>	
				</div>
		<p>-----------------------------------------------------------------</p>
		<section>		
			<div>
				<textarea rows="" cols="" id="registerReply"></textarea>				
				<button type="button" onclick="registerReply()">등록하기</button>
			</div>	
			<p id="errors">${err}&nbsp;</p>			
			<c:forEach items="${boardReply}" var="reply">
				<p>
					<label id="nickName">${reply.userNo.nickName} : </label>				
					<label id="replyContent">${reply.replyContent}</label>						
				</p>	
				<div id="reBtn">	
					<button type="button" onclick="modifyReply()">수정</button>
					<button type="button" onclick="deleteReply()">삭제</button>	
				</div>
			</c:forEach>				
		</section>
	</fieldset>
</body>
</html>