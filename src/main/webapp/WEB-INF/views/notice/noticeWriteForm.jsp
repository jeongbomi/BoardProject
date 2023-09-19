<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>글쓰기</title>
	<link rel="stylesheet" href="<c:url value='/css/writeNoticeForm.css'/>">
</head>
<body>
    
    <div class="container">
        <h1>글쓰기</h1>
        <form action="addNotice.do" name="addNotice" id="addNotice" method="post">
            <div class="form-group">
                <label for="writer_user">작성자</label>
                <input type="text" name="writer_user" id="writer_user" value="${loginMember.uid}" readonly>
            </div>
            
            <div class="form-group">
                <label for="title">제목:</label>
                <input type="text" name="title" id="title" placeholder="제목을 입력해주세요" required>
            </div>
            
            <label for="contents">내용:</label>
            <textarea name="contents" id="contents" placeholder="내용을 입력해주세요" required></textarea>
            
            <div class="form-group checkbox">
                <input type="checkbox" name="fixed_yn" id="fixed_yn">
                <label for="fixed_yn">상단 고정 여부</label>
            </div>
            
            <div class="buttons">
                <button id="insertNotice" type="submit" class="submit">등록</button>
                <button type="button" class="cancel" onclick="window.history.back()">취소</button>
            </div>
        </form>
    </div>

<script type="text/javascript">
document.querySelector("#addNotice").addEventListener("submit", e => {
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
	        writer_uid: "${loginMember.uid}",
	        title: title.value,
	        contents: contents.value,
	        fixed_yn : fixed_yn
	      };

	      fetch("<c:url value='/notice/addNotice.do'/>", {
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
	        	  location.href = "<c:url value='/notice/noticeList.do'/>"; 
	          }
	      });
	
	return false;
})

</script>

</body>
</html>
