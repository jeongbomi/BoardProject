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
</head>
<body>
    
    <div class="container">
    <h1>게시판 목록</h1>
    
    <div class="write-container">
        <button class="write"><a href="<c:url value='addBoardForm.do'/>">글쓰기</a></button>
    </div>
    
    <form action="BoardDeleteCheckbox.do" method="post">
    	
        <div class="notice_board">
            <!-- title 열 -->
            <ul class="title_row ">
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
            <c:forEach var="board" items="${board}">
                <ul class="board_row">
                    <li class="check"><input type="checkbox" class="item" name="delete_checkbox" value="${board.boardId}" onclick="checkSelect()"/></li>
                    <li class="noticeId"><a href="boardView.do?boardId=${board.boardId}">${board.boardId}</a></li>
                    <li class="title"><a href="boardView.do?boardId=${board.boardId}">${board.title}</a></li>
                    <li><a href="boardView.do?boardId=${board.boardId}">${board.writer_uid}</a></li>
                    <li>${board.reg_date}</li>
                    <li>${board.mod_date}</li>
                    <li class="view_count">${board.view_count}</li>
                </ul>
            </c:forEach>
            
            <c:if test="${empty board}">
            	<ul>
            		<li class="search">검색결과가 없습니다</li>
             	</ul>
            </c:if>
        </div>
		
		<div class="delete-container">
    		<button class="delete" type="submit"><a>삭제</a></button>
    	</div>
    	
    </form>
    </div>
    
	<script src="../js/checkbox.js"></script>   
    </body>
</html>