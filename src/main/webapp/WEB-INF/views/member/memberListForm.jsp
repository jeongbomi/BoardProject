<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>    

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>전체회원 리스트</title>
	<link rel="stylesheet" href="<c:url value='/css/memberListForm.css'/>">
</head>
<body>

    <h1>전체회원목록</h1>
    
    	<div class="write-container">
   			<button class="mypage"><a href="mypageForm.do">Back</a></button>
    	</div>
    
        <div class="memberList">
        	<ul class="title_row">
        		<li>아이디</li>
                <li>이름</li>
                <li>비밀번호</li>
                <li>전화번호</li>
        	</ul>
            <c:forEach var="member" items="${memberList}">
                	<ul class="board_row">
	                	<li>${member.uid}</li>
	                    <li>${member.name}</li>
	                    <li>${member.password}</li>
	                    <li>${member.phone}</li>
                    </ul>
            </c:forEach>
        </div>

</body>
</html>