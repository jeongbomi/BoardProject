<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>    

<link rel="stylesheet" href="<c:url value='/resources/css/noticeForm.css' />">

    
    <div class="container">
    <h1>게시판 목록</h1>
    
    <div class="write-container">
        <button id="writeButton" class="write">글쓰기</button>
    </div>
    
	<form name="pageForm" id="pageForm" action="<c:url value='/board/boardList.do'/>" method="post" >
		<input type="hidden" name="pageNo" id="pageNo" value="${result.board.pageNo}" />
		<input type="hidden" name="searchTitle" id="searchTitle" value="${result.board.searchTitle}" >
		<input type="hidden" name="pageLength" id="pageLength" value="${result.board.pageLength}" >
    </form>
	
	<form name="mForm" id="mForm" action="<c:url value='/notice/noticeList.do'/>" method="post" >
		<input type="hidden" name="pageNo" id="pageNo" value="${result.board.pageNo}" />
			<div style="margin:0px auto;">
				<div class="containerSearch">
					<label for="pageLength">건수 : </label>
					<select name="pageLength" id="pageLength" >
						<option value="10" ${result.board.pageLength == 10 ? 'selected="selected"' : ''} >10건</option>
						<option value="20" ${result.board.pageLength == 20 ? 'selected="selected"' : ''} >20건</option>
						<option value="50" ${result.board.pageLength == 50 ? 'selected="selected"' : ''} >50건</option>
						<option value="100" ${result.board.pageLength == 100 ? 'selected="selected"' : ''} >100건</option>
					</select>

					<label for="searchTitle">제목 : </label>
					<input type="text" name="searchTitle" id="searchTitle" value="${result.board.searchTitle}" style="flex:1">
					<input type="submit" value="검색" id="searchBtn"/>
				</div>
			</div>
			
		    <div class="notice_board">
		    
		    	<ul id="boardItem" class="board_row" style="display:none">
		    		<li class="check"><input type="checkbox" class="item" name="delete_checkbox" value="${board.boardId}" onclick="checkSelect()"/></li>
		    		<li id="boardId" class="noticeId"></li>
		    		<li class="titleCheck"><a href="#" id="title"></a></li>
		    		<li id="writer_uid"></li>
		    		<li id="reg_date"></li>
		    		<li id="mod_date"></li>
		    		<li id="view_count" class="view_count"></li>
		    	</ul>
		    	
		        
	            <!-- 게시판 title 열 -->
	            <ul class="title_row">
	            	<li class="check">
	            		<div class="select_all_container">
				            <label for="select_all_checkbox"></label>
				            <input type="checkbox" id="select_all_checkbox" onclick="checkSelectAll()">
				        </div>
	            	</li>
	                <li class="noticeId">번호</li>
	                <li class="titleCheck">제목</li>
	                <li>작성자</li>
	                <li>작성일</li>
	                <li>수정일</li>
	                <li class="view_count">조회수</li>
	            </ul>
	            
	            <div id="boardList">
	            <!-- 게시글 추가로 들어오는 위치 -->
	            <c:forEach var="board" items="${result.boardList}">
	                <ul class="board_row">
	                	<li class="check"><input type="checkbox" class="item" name="delete_checkbox" value="${board.boardId}" onclick="checkSelect()"/></li>
	                    <li class="noticeId">${board.boardId}</li>
	                    <li class="titleCheck"><a href="#" data-board-id="${board.boardId}">${board.title}</a></li>
	                    <li>${board.writer_uid}</li>
	                    <li>${board.reg_date}</li>
	                    <li>${board.mod_date}</li>
	                    <li class="view_count">${board.view_count}</li>
	                </ul>
	            </c:forEach>
		        
		        <c:if test="${empty result.boardList}">
	            	<ul>
	            		<li class="search">검색결과가 없습니다</li>
	             	</ul>
	            </c:if>
		        </div>
		   	</div>
			
			<div style="text-align: center;margin-top:20px;">
	           	<c:if test="${result.board.navStart != 1}">
	           		<a href="javascript:jsPageNo(${result.board.navStart-1})" style="padding: 10px;border: 1px solid black;"> &lt; </a> 
	           	</c:if>
	           	<c:forEach var="item" begin="${result.board.navStart}" end="${result.board.navEnd}">
	           		<c:choose>
	           			<c:when test="${result.board.pageNo != item }">
	           				<a href="javascript:jsPageNo(${item})" style="padding: 10px;border: 1px solid black;">${item}</a>  
	           			</c:when>
	           			<c:otherwise>
	           				<strong style="font-size:2rem; padding: 7px;">${item}</strong>   
	           			</c:otherwise>
	           		</c:choose>
	           	</c:forEach>
	           	<c:if test="${result.board.navEnd != result.board.totalPageSize}">
	           		<a href="javascript:jsPageNo(${result.board.navEnd+1})" style="padding: 10px;border: 1px solid black;"> &gt; </a> 
	           	</c:if>
           	</div>
           	
			<div class="delete-container">
		  		<button class="delete" id="deleteBtn" type="button">삭제</button>
		  	</div>
		  	
    	</form>

    </div>
    
    
<!-- 글쓰기 ======================================================================== -->
<div id="writeForm" title="글쓰기" style="display:none">
	<table class="writeTable">
		<tr>
			<td>작성자</td>
			<td><input type="text" id="write_uid" name="write_uid" value="${loginMember.id}" readonly></td>
		</tr>
		<tr>
			<td>제목</td>
			<td><input type="text" id="writeTitle" name="title" placeholder="제목을 입력해주세요" required></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea id="contents" name="contents" placeholder="내용을 입력해주세요" required></textarea></td>
		</tr>
	</table>
</div>
<!-- ============================================================================= -->

<!-- 글 상세보기 ======================================================================== -->
<div id="viewForm" class="notice_detail" title="상세보기" style="display: none;">
    <table border="1">
        <tr>
            <td class="title">게시판 번호</td>
            <td class="content detail-boardId"></td>
            <td class="title">작성일</td>
            <td class="content detail-reg_date"></td>
            <td class="title">수정일</td>
            <td class="content detail-mod_date"></td>
            <td class="title">조회수</td>
            <td class="content detail-view_count"></td>
        </tr>
        
        <tr>
            <td class="title">제목</td>
            <td class="content detail-title" colspan="5"></td>
            <td class="title">작성자</td>
            <td class="content detail-writer_uid"></td>
        </tr>
        
        <tr>
            <td class="title">내용</td>
            <td class="content detail-contents" id=content colspan="7"><pre></pre></td>
        </tr>
    </table>

    <div class="button-container">
        <button id="detail-update">글 수정</button>
        <button id="detail-delete">삭제</button>
    </div>
</div>
<!-- ============================================================================= -->    

<!-- 글수정 ======================================================================== -->
<div id="updateForm" title="게시판 수정" style="display:none">
	<table class="updateTable">
		<tr>
			<td>작성자</td>
			<td><input type="text" id="write_uid" name="write_uid" value="${loginMember.id}" readonly></td>
		</tr>
		<tr>
			<td>제목</td>
			<td><input type="text" id="updateTitle" name="title" placeholder="제목을 입력해주세요" required></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea id="updateContents" name="contents" placeholder="내용을 입력해주세요" required></textarea></td>
		</tr>
	</table>
</div>
<!-- ============================================================================= -->

<!-- 글삭제 ======================================================================== -->
<div id="deleteBoardForm" class="deleteForm" title="게시판 삭제" style="display:none">
	<p>해당 게시판을 삭제하시겠습니까?</p>
</div>
<!-- ============================================================================= -->


<script src="<c:url value='/resources/js/checkbox.js'/>"/></script>   
<script>
//검색하면 다시 1 페이지로 가도록 하기
document.querySelector("#mForm").addEventListener("submit", e => {
	document.querySelector("#mForm > #pageNo").value = "1";
	return true;
});

//페이징 검색
function jsPageNo(pageNo) {
	document.querySelector("#pageForm > #pageNo").value = pageNo;
	document.querySelector("#pageForm").submit(); 
}
</script>

<script type="text/javascript">
//게시판 삭제
document.querySelector("#deleteBtn").addEventListener("click", e => {
 	e.preventDefault();
 	const boardList = document.querySelector("#boardList");
 	let ids = [];
 	const items = document.querySelectorAll(".item:checked");
 	const boardId = document.querySelector("#boardList ul:last-child li:first-child input[type='checkbox']").value;
 	if (items.length == 0) {
 		alert("삭제할 항목을 선택하세요");
 		return false;
 	}

 	if (!confirm("삭제하시겠습니까?")) return false;
 	
 	items.forEach(item => {
 		ids.push(item.value);
 	});
 	console.log(ids);
 	
 	const param = {
		ids: ids,
		boardId: boardId
	};
 	console.log(boardId);
 	fetch("<c:url value='/board/deleteBoards.do'/>", {
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
	        //서버에서 게시판 삭제 됨
	        //1. 화면 부분에 있는 자료를 삭제
			//삭제 함수 
			for (let i=items.length-1; i>=0; i--) {
				boardList.removeChild(items[i].parentNode.parentNode);
			}
			//2. 서버에서 삭제 건수만큼 얻는 게시판 목록을 출력한다
			const boardListJson = json.boardList;
			const boardItem = document.querySelector("#boardItem");
			    	  
			for (let i=0;i<boardListJson.length;i++) {
		      	  const board = boardListJson[i];
		      	  const newBoardItem = boardItem.cloneNode(true);
				  const title = newBoardItem.querySelector("#title");
			
				  newBoardItem.querySelector("#boardId").innerText = board.boardId; 
		     	  title.innerText = board.title;
		     	  newBoardItem.querySelector("#writer_uid").innerText = board.writer_uid; 
		     	  newBoardItem.querySelector("#reg_date").innerText = board.reg_date;
		     	  newBoardItem.querySelector("#mod_date").innerText = board.mod_date; 
		     	  newBoardItem.querySelector("#view_count").innerText = board.view_count; 
		     	  
		     	  //이벤트 핸들링 
		     	  newBoardItem.querySelector(".item").value = board.boardId;
		     	  newBoardItem.querySelector(".item").addEventListener("click", e => checkSelect());

		     	 
		     	  newBoardItem.style.display = "";
		     	  boardList.appendChild(newBoardItem);
			} 
	   	  
	    } else {
	    	alert(json.message);
	    }
	});
 	
 	return false;
});

//모달창------------------------------------------------------------------------------------------
$(document).ready(function() {
	
	//글쓰기------------------------------------------------------------
	$("#writeButton").click(function() {
        $("#writeForm").dialog({
            modal: true,
            width: 700,
            height: 700,
            buttons: {
                "작성": function() {
                	const title = document.querySelector("#writeTitle");
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
                        writer_uid: "${loginMember.id}",
                        title: title.value,
                        contents: contents.value
                    };
                	
                	fetch("<c:url value='/board/insert.do'/>", {
                        method: "POST",
                        headers: {
                            "Content-Type": "application/json; charset=UTF-8"
                        },
                        body: JSON.stringify(param)
                    })
                    .then(response => response.json())
                    .then(json => {
                        alert(json.message);
                        if (json.status) {
                            location.href = "<c:url value='/board/boardList.do'/>";
                        }
                    })
                	
                	$(this).dialog("close");
                },
                "취소": function() {
                    $(this).dialog("close");
                }
            },
            close: function() {
                // 모달이 닫힐 때 초기화 또는 추가적인 로직
            }
        });
        
        //글쓰기 모달창 open
        $("#writeForm").dialog("open");
    });
	
	
	//상세보기------------------------------------------------------------
    // 타이틀을 클릭했을 때 모달 창 열기
    $("#boardList .board_row .titleCheck a").click(function(e) {
        e.preventDefault();
    	
        //상세보기 모달창 초기화
    	$("#viewForm").dialog({
            modal: true,
            width: 900,
            height: 500,
            buttons: {
            	"닫기": function() {
            		$(this).dialog("close");
            		location.href = "<c:url value='/board/boardList.do'/>";
            	}
            },
            close: function() {
            	location.href = "<c:url value='/board/boardList.do'/>";
            }
            
        });
    	
        const boardId = $(this).data("board-id");
        console.log("Clicked Board ID:", boardId);
        
        $.ajax({
            type: "POST",
            url: "<c:url value='/board/detail.do'/>",
            data: JSON.stringify({ boardId: boardId }),
            contentType: "application/json; charset=UTF-8",
            dataType: "json",
            success: function(response) {
                console.log("Response Data:", response);
                
                if (response.status) {
                    const board = response.board;
                    console.log("board Data:", board);
                             
                    $(".detail-boardId").text(board.boardId);
                    $(".detail-reg_date").text(board.reg_date);
                    $(".detail-mod_date").text(board.mod_date);
                    $(".detail-view_count").text(board.view_count);
                    $(".detail-title").text(board.title);
                    $(".detail-writer_uid").text(board.writer_uid);
                    $(".detail-contents pre").text(board.contents);
                    
                    $("#viewForm").dialog("open");
                } 
            }
        });
    });

	
	//글 수정------------------------------------------------------------
	$("#detail-update").click(function(e) {
	    e.preventDefault();
	    
	    const boardId = $(".detail-boardId").text();
	    const title = $(".detail-title").text();
	    const contents = $(".detail-contents pre").text();
	    
	    $("#updateTitle").val(title);
	    $("#updateContents").val(contents);
	    
	    $("#updateForm").dialog({
	        modal: true,
	        width: 700,
	        height: 600,
	        buttons: {
	            "수정": function() {
	                // 수정 버튼을 눌렀을 때 처리하는 로직 추가
	                const updatedTitle = $("#updateTitle").val();
	                const updatedContents = $("#updateContents").val();
	                
	                if (updatedTitle === "") {
	                    alert("제목은 필수 입력입니다.");
	                    $("#updateTitle").focus();
	                    return;
	                }
	                
	                if (updatedContents === "") {
	                    alert("내용은 필수 입력입니다.");
	                    $("#updateContents").focus();
	                    return;
	                }
	                
	                const param = {
	                    boardId: boardId,
	                    title: updatedTitle,
	                    contents: updatedContents
	                };
	                
	                $.ajax({
	                    type: "POST",
	                    url: "<c:url value='/board/update.do'/>",
	                    data: JSON.stringify(param),
	                    contentType: "application/json; charset=UTF-8",
	                    dataType: "json",
	                    success: function(json) {
	                    	alert(json.message);
	                    	if (json.status) {
	                    		location.href = "<c:url value='/board/boardList.do'/>";         	
	                    	} 
	                    }
	                });
	                
	                $("#updateForm").dialog("close");
	            },
	            "취소": function() {
	            	$("#updateForm").dialog("close");
	            }
	        },
	        close: function() {
	            // 모달이 닫힐 때 초기화 또는 추가적인 로직
	        }
	    });
	});
	
	//상세보기쪽에서
	//글삭제------------------------------------------------------------
	$("#detail-delete").click(function() {
    	$("#deleteBoardForm").dialog({
            autoOpen: false,
            modal: true,
            width: 400,
            buttons: {
            	"Yes": function() {
                	const boardId = $(".detail-boardId").text();
                	
                	// "Yes" 버튼 클릭 시
                    const param = {
                    		boardId: boardId
                    };
                	
                    $.ajax({
                        type: "POST",
                        url: "<c:url value='/board/delete.do'/>",
                        data: JSON.stringify(param),
                        contentType: "application/json; charset=UTF-8",
                        dataType: "json",
                        success: function(json) {
                        	alert(json.message);
                        	if (json.status) {
                        		location.href = "<c:url value='/board/boardList.do'/>";
                        	} else {
                        		//삭제 실패 시 처리할 내용
                        	}
                        }
                    });
                 	// 모달 창 닫기
                    $(this).dialog("close");
            	},
            	"No": function() {
            		// "No" 버튼 클릭 시 모달 창 닫기
                    $(this).dialog("close");
            	}
            }
    	});
    	
    	// 삭제 모달창 open
    	$("#deleteBoardForm").dialog("open");
    });


});

</script>
