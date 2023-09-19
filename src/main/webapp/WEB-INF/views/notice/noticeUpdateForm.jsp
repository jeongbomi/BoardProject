<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

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
        <form action="updateNotice.do" id="updateNotice" name="updateNotice" method="post">
        <input type="hidden" name="noticeId" value="${notice.noticeId}" />
            <div class="form-group">
                <label for="writer_user">작성자</label>
                <input type="text" name="writer_user" id="writer_user" value="${loginMember.uid}" readonly>
            </div>
            
            <div class="form-group">
                <label for="title">제목:</label>
                <input type="text" name="title" id="title" value="${notice.title}" >
            </div>
            
            <label for="contents">내용:</label>
            <textarea name="contents" id="contents">${notice.contents}</textarea>
            
            <div class="form-group checkbox">
                <input type="checkbox" name="fixed_yn" id="fixed_yn" ${notice.fixed_yn eq 'Y' ? 'checked' : ''}>
                <label for="fixed_yn">상단 고정 여부</label>
            </div>
            
            <div class="buttons">
                <button id="updateNotice" type="submit" class="submit">수정</button>
                <button type="button" class="cancel" onclick="window.history.back()">취소</button>
            </div>
        </form>
    </div>
    
<script type="text/javascript">
document.querySelector("#updateNotice").addEventListener("submit", e => {
	//이벤트 핸들러의 기본 동작을 취소한다
	e.preventDefault();
	const title = document.querySelector("#title");
	const contents = document.querySelector("#contents");
	const fixed_yn = document.querySelector("#fixed_yn").checked ? "Y" : "N";

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
		noticeId: ${notice.noticeId},
		writer_uid: "${loginMember.uid}",
        title: title.value,
        contents: contents.value,
        fixed_yn : fixed_yn
    };

    fetch("<c:url value='/notice/updateNotice.do'/>", {
      method: "POST",
      headers: {
        "Content-Type": "application/json; charset=UTF-8",
      },
      body: JSON.stringify(param),
    })
    .then((response) => response.json())
    .then((json) => {
  	  alert(json.message);
        if (json.status) {
      	  location.href = "<c:url value='/notice/noticeView.do?noticeId'/>=${notice.noticeId}"; 
        }
    });
	
	return false;
})
 
 
</script>	
</body>
</html>