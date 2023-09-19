<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항 상세보기</title>
	<link rel="stylesheet" href="<c:url value='/css/noticeViewForm.css'/>">
</head>
<body>
    
    <div class="notice_detail">
    <h1>공지사항 상세보기</h1>
        
        <c:choose>
            <c:when test="${not empty notice}">
                <table border="1">
                    <tr>
                        <td class="title">공지사항 번호</td>
                        <td class="content">${notice.noticeId}</td>
                        <td class="title">고정여부</td>
                        <td class="content">${notice.fixed_yn}</td>
                        <td class="title">조회수</td>
                        <td class="content">${notice.view_count}</td>
                    </tr>
                    
                    <tr>
                        <td class="title">작성자</td>
                        <td class="content">${notice.writer_uid}</td>
                        <td class="title">작성일</td>
                        <td class="content">${notice.reg_date}</td>
                        <td class="title">수정일</td>
                        <td class="content">${notice.mod_date}</td>
                    </tr>
                    
                    <tr>
                        <td class="title">제목</td>
                        <td class="content" colspan="7">${notice.title}</td>
                    </tr>
                    
                    <tr>
                        <td class="title">내용</td>
                        <td class="content" id="content" colspan="7"><pre>${notice.contents}</pre></td>
                    </tr>
                </table>
    
                <c:if test="${notice.writer_uid eq loginMember.uid}">
                    <div class="button-container">
                        <div class="update">              
                            <a href="updateNoticeForm.do?noticeId=${notice.noticeId}">글 수정</a>
                        </div>
                        <div class="delete">
                            <a href="#" onclick="confirmDelete(${notice.noticeId})">삭제</a>
                        </div>
                    </div>
                </c:if>
            </c:when>
            <c:otherwise>
                <p>해당 공지사항이 존재하지 않습니다.</p>
            </c:otherwise>
        </c:choose>
    
	    
    
    </div>
    <div class="back_link">
            <a href="<c:url value='/notice/noticeList.do'/>">목록으로 돌아가기</a>
    </div>
    
<script>
//삭제
function confirmDelete(noticeId) {
    const confirmation = confirm("삭제하시겠습니까?");
    if (confirmation) {
        const param = {
            noticeId: noticeId
        };
        
        fetch("deleteNotice.do", {
            method: "POST",
            headers: {
                "Content-Type": "application/json; charset=UTF-8",
            },
            body: JSON.stringify(param),
        })
        .then(response => response.json())
        .then(json => {
            alert(json.message);
            if (json.status) {
                location.href = "<c:url value='/notice/noticeList.do'/>"; // 삭제 성공 시 공지사항 리스트로 이동
            } else {
                // 삭제 실패 시 처리할 내용을 추가
            }
        });
    }
}
        
</script>
</body>
</html>
