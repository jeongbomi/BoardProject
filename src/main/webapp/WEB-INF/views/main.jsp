<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


    <div id="slideShow">
      <div id="slides">
        <img src="<c:url value='/resources/images/photo-1.jpg'/>" alt=""/>
        <img src="<c:url value='/resources/images/photo-2.jpg'/>" alt=""/>
        <img src="<c:url value='/resources/images/photo-3.jpg'/>" alt=""/>
        <img src="<c:url value='/resources/images/photo-4.jpg'/>" alt=""/>
        <button id="prev">&lang;</button>
        <button id="next">&rang;</button>
      </div>
    </div>
    
    <div id="contents">
    
      <div id="links">
        <ul>
          <li>
            <a href="#">
              <span id="quick-icon1"></span>
              <p>교통편 예약</p>
            </a>
          </li>
          <li>
            <a href="#">
              <span id="quick-icon2"></span>
              <p>숙소 예약</p>
            </a>            
          </li>
          <li>
            <a href="#">
              <span id="quick-icon3"></span>
              <p>문의하기</p>
            </a>            
          </li>
        </ul>
      </div>
      
      <div id="tabMenu">
        <input type="radio" id="tab1" name="tabs" checked>
        <label for="tab1">공지사항</label>
        <input type="radio" id="tab2" name="tabs">
        <label for="tab2">게시판</label> 
        <button id="more" onclick="redirectToTab()">+</button> 
          
        <!-- 공지사항 -->
        <div id="notice" class="tabContent">
		  <h2>공지사항 내용입니다.</h2>
		  
		  <c:choose>
		    <c:when test="${not empty noticeTop5}">
		      <ul>
		        <c:forEach var="notice" items="${noticeTop5}">
	              <li><a href="#" onclick="dialogDetail(${notice.noticeId})">${notice.title}</a></li>
	            </c:forEach>
		      </ul>
		    </c:when>
		    <c:otherwise>
		      <ul>
		        <li>현재 자료가 존재하지 않습니다.</li>
		      </ul>
		    </c:otherwise>
		  </c:choose>
		</div>
		
        <!-- 게시판 -->
        <div id="board" class="tabContent">
		  <h2>게시판 내용입니다.</h2>
		  <c:choose>
		    <c:when test="${not empty boardTop5}">
		      <ul>
		        <c:forEach var="board" items="${boardTop5}">
	              <li><a href="<c:url value='board?boardId=${boardId}' />">${board.title}</a></li>
	            </c:forEach>
		      </ul>
		    </c:when>
		    <c:otherwise>
		      <ul>
		        <li>현재 자료가 존재하지 않습니다.</li>
		      </ul>
		    </c:otherwise>
		  </c:choose>
		</div>       
      </div>
      
    </div> 


      
    <script src="<c:url value='/resources/js/main.js'/>"/></script>

