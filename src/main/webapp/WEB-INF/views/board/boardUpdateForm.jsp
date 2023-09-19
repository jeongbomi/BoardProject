<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="<c:url value='/css/updateNoticeForm.css'/>">
</head>
<body>

    
	<div class="container">
        <h1>글 수정하기</h1>
        <form action="updateBoard.do" id="updateBoard" method="post">
        <input type="hidden" name="boardId" value="${board.boardId}" />
            <div class="form-group">
                <label for="writer_user">작성자</label>
                <input type="text" name="writer_user" id="writer_user" value="${loginMember.uid}" readonly>
            </div>
            
            <div class="form-group">
                <label for="title">제목:</label>
                <input type="text" name="title" id="title" value="${board.title}" >
            </div>
            
            <label for="contents">내용:</label>
            <textarea name="contents" id="contents" >${board.contents}</textarea>
            
            <div class="buttons">
                <button id="updateNotice" type="submit" class="submit">수정</button>
                <button type="button" class="cancel" onclick="window.history.back()">취소</button>
            </div>
        </form>
    </div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
document.querySelector("#updateBoard").addEventListener("submit", e => {
	//이벤트 핸들러의 기본 동작을 취소한다
	e.preventDefault();
	const title = document.querySelector("#title");
	const contents = document.querySelector("#contents");

	if (title.value == "") {
		alert("제목은 필수 입력입니다");
		title.focus();
		return false;
	}
	if (contents.value == "") {
		alert("내용은 필수 입력입니다");
		contents.focus();
		return false;
	}
	
	const param = {
		boardId: ${board.boardId},
		writer_uid: "${loginMember.uid}",
        title: title.value,
        contents: contents.value
    };

	$.ajax({
        type: "POST",
        url: "<c:url value='/board/updateBoard.do'/>",
        data: JSON.stringify(param),
        contentType: "application/json; charset=UTF-8",
        dataType: "json",
        success: function(json) {
        	alert(json.message);
        	if (json.status) {
        		location.href = "<c:url value='/board/boardView.do?boardId'/>=${board.boardId}";
        	} else {
        	}
        }
    });
	
	return false;
})
 
 
</script>	
</body>
</html>