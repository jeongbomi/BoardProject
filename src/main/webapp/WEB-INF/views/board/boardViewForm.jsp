<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시판 상세보기</title>
	<link rel="stylesheet" href="<c:url value='/css/noticeViewForm.css'/>">
</head>
<body>

    
    <div class="notice_detail">
    <h1>게시판 상세보기</h1>
        <c:choose>
	        <c:when test="${not empty board}">
	            <table border="1">
	                <tr>
	                    <td class="title">게시판 번호</td>
	                    <td class="content">${board.boardId}</td>
	                    <td class="title">작성일</td>
	                    <td class="content">${board.reg_date}</td>
	                    <td class="title">수정일</td>
	                    <td class="content">${board.mod_date}</td>
	                    <td class="title">조회수</td>
	                    <td class="content">${board.view_count}</td>
	                </tr>
	                
	                <tr>
	                    <td class="title">제목</td>
	                    <td class="content" colspan="5">${board.title}</td>
	                    <td class="title">작성자</td>
	                    <td class="content">${board.writer_uid}</td>
	                </tr>
	                
	                <tr>
	                    <td class="title">내용</td>
	                    <td class="content" id=content colspan="7"><pre>${board.contents}</pre></td>
	                </tr>
	            </table>
	
	            <c:if test="${board.writer_uid eq loginMember.uid}">
	                <div class="button-container">
	                    <div class="update">
	                        <a href="updateBoardForm.do?boardId=${board.boardId}">글 수정</a>
	                    </div>
	                    <div class="delete">
	                        <a href="#" onclick="confirmDelete(${board.boardId})">삭제</a>
	                    </div>
	                </div>
	            </c:if>
	        </c:when>
	        <c:otherwise>
	            <p>해당 게시판이 존재하지 않습니다.</p>
	        </c:otherwise>
	    </c:choose>
    
    </div>
        
    <div class="back_link">
        <a href="<c:url value='/board/boardList2.do'/>">목록으로 돌아가기</a>
    </div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
//삭제
function confirmDelete(boardId) {
    const confirmation = confirm("삭제하시겠습니까?");
    if (confirmation) {
        const param = {
        	boardId: boardId
        };
        
        $.ajax({
            type: "POST",
            url: "deleteBoard.do",
            data: JSON.stringify(param),
            contentType: "application/json; charset=UTF-8",
            dataType: "json",
            success: function(json) {
            	alert(json.message);
            	if (json.status) {
            		location.href = "<c:url value='/board/boardList.do'/>"; // 삭제 성공 시 공지사항 리스트로 이동
            	} else {
            		//삭제 실패 시 처리할 내용
            	}
            }
        });
    }
}
        
</script>
</body>
</html>
