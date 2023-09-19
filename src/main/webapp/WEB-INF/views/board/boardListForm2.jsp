<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>    

<!DOCTYPE html>
<head>
	<meta charset="UTF-8">
	<title>게시판</title>
	<link rel="stylesheet" href="<c:url value='/css/noticeForm.css'/>">
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/smoothness/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<style>
        #writeModal {
            display: none; /* 폼을 숨김 */
        }
    </style>
</head>
<body>

    
    <div class="container">
    <h1>게시판 목록</h1>
    
    <div class="write-container">
        <button id="writeButton" class="write"><a href="<c:url value='addBoardForm.do'/>">글쓰기</a></button>
    </div>
    
    <form action="BoardDeleteCheckbox.do" method="post">
    <div class="notice_board">
    	<ul id="boardItem" class="board_row" style="display:none">
    		<li class="check"><input type="checkbox" class="item" name="delete_checkbox" value="${board.boardId}" onclick="checkSelect()"/></li>
    		<li id="boardId" class="noticeId"></li>
    		<li class="title"><a href="boardView.do?boardId=${boardId}" id="title"></a></li>
    		<li id="writer_uid"></li>
    		<li id="reg_date"></li>
    		<li id="mod_date"></li>
    		<li id="view_count" class="view_count"></li>
    	</ul>
    	
        <div id="boardList" class="notice_board">
            <!-- title 열 -->
            <ul class="title_row">
            	<li class="check">
            		<div class="select_all_container">
			            <label for="select_all_checkbox"></label>
			            <input type="checkbox" id="select_all_checkbox" onclick="checkSelectAll()">
			        </div>
            	</li>
                <li class="noticeId">번호</li>
                <li class="title">제목</li>
                <li>작성자</li>
                <li>작성일</li>
                <li>수정일</li>
                <li class="view_count">조회수</li>
            </ul>
            
            <!-- 게시글 추가로 들어오는 위치 -->
            <c:forEach var="board" items="${board2}">
                <ul class="board_row">
                	<li class="check"><input type="checkbox" class="item" name="delete_checkbox" value="${board.boardId}" onclick="checkSelect()"/></li>
                    <li class="noticeId">${board.boardId}</li>
                    <li class="title"><a href="boardView.do?boardId=${board.boardId}">${board.title}</a></li>
                    <li>${board.writer_uid}</li>
                    <li>${board.reg_date}</li>
                    <li>${board.mod_date}</li>
                    <li class="view_count">${board.view_count}</li>
                </ul>
            </c:forEach>
        </div>
            
   	</div>
   	
    <div style="text-align: center; margin-top: 10px;">
   		<input type="button" id="moreBtn" value="더보기" />
   	</div>

	<div class="delete-container">
  		<button class="delete" type="submit"><a>삭제</a></button>
  	</div>
    	
    </form>
    </div>


<script src="../js/checkbox.js"></script>   
<script>

document.querySelector("#moreBtn").addEventListener("click", e => {
	e.preventDefault();
	
	const param = {
			boardId: document.querySelector("#boardList ul:last-child li:nth-child(2)").innerText,
	};
	
	$.ajax({
        type: "POST",
        url: "<c:url value='/board/ajaxList2.do'/>",
        data: JSON.stringify(param),
        contentType: "application/json; charset=UTF-8",
        dataType: "json",
        success: function(json) {
			let html = "";
			if (json.status) {
				const boardList = json.boardList;
				const boardItem = $("#boardItem");
                const boardListHTML = $("#boardList");

                for (let i = 0; i < boardList.length; i++) {
                    const board = boardList[i];
                    const newBoardItem = boardItem.clone();
                    const title = newBoardItem.find("#title");

                    newBoardItem.find("#boardId").text(board.boardId);

                    title.text(board.title);
                    title.attr("href", title.attr("href").replace("{boardId}", board.boardId));

                    newBoardItem.find("#writer_uid").text(board.writer_uid);
                    newBoardItem.find("#reg_date").text(board.reg_date);
                    newBoardItem.find("#mod_date").text(board.mod_date);
                    newBoardItem.find("#view_count").text(board.view_count);

                    newBoardItem.css("display", "");
                    boardListHTML.append(newBoardItem);
					
				}
			}
		}
	});

	return false;
})

</script>
    </body>
</html>