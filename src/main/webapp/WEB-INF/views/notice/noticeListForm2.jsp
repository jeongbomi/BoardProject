<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>    


<!DOCTYPE html>
<head>
	<meta charset="UTF-8">
	<title>공지사항</title>
	<link rel="stylesheet" href="<c:url value='/css/noticeForm.css'/>">
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/smoothness/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

</head>
<body>
    
    
    <div class="container">
	    <h1>공지사항 목록</h1>
	    <div class="write-container">
	        <c:if test="${loginMember.uid == 'admin'}">
	        	<button id="writeButton" class="write">글쓰기</button>
	    	
	    	<div id="writeModal" title="글쓰기">
		    <form id="writeForm" action="addNotice.do" method="post">
		        <label for="write_uid">작성자</label>
		        <input type="text" id="write_uid" name="write_uid" value="${loginMember.uid}" readonly>
		        <br>
		        <br>
		        <label for="writeTitle">제목:</label>
		        <input type="text" id="writeTitle" name="title" placeholder="제목을 입력해주세요" required>
		        <br>
		        <label for="contents">내용:</label>
		        <textarea id="contents" name="contents" placeholder="내용을 입력해주세요" required></textarea>
		    	<div class="form-group checkbox">
                <input type="checkbox" name="fixed_yn" id="fixed_yn">
                <label for="fixed_yn">상단 고정 여부</label>
            </div>
		    </form>
			</div>
			
			</c:if>
	    </div>
    
	    <form name="pageForm" id="pageForm" action="<c:url value='/notice/noticeList.do'/>" method="post" >
			<input type="hidden" name="pageNo" id="pageNo" value="${result.notice.pageNo}" />
			<input type="hidden" name="searchTitle" id="searchTitle" value="${result.notice.searchTitle}" >
			<input type="hidden" name="pageLength" id="pageLength" value="${result.notice.pageLength}" >
	    </form>
    
	    <form name="mForm" id="mForm" action="<c:url value='/notice/noticeList.do'/>" method="post" >
			<input type="hidden" name="pageNo" id="pageNo" value="${result.notice.pageNo}" />
				<div style="margin:0px auto;">
					<div style="display: flex; margin:0px auto; width:70%; justify-align: center">
						<label>건수: </label>
						<select name="pageLength" id="pageLength" >
							<option value="10" ${result.notice.pageLength == 10 ? 'selected="selected"' : ''} >10건</option>
							<option value="20" ${result.notice.pageLength == 20 ? 'selected="selected"' : ''} >20건</option>
							<option value="50" ${result.notice.pageLength == 50 ? 'selected="selected"' : ''} >50건</option>
							<option value="100" ${result.notice.pageLength == 100 ? 'selected="selected"' : ''} >100건</option>
						</select>
	
						<label>제목 : </label>
						<input type="text" name="searchTitle" id="searchTitle" value="${result.notice.searchTitle}" style="flex:1">
						<input type="submit" value="검색"/>
					</div>
				</div>	
    	
		        <div class="notice_board">
		        
		        	<ul id="noticeItem" class="board_row" style="display:none">
			    		<li class="check">
	                    	<input type="checkbox" class="item"/>
	                    </li>
			    		<li id="noticeId" class="noticeId"></li>
			    		<li class="title"><a href="noticeView.do?noticeId"=${noticeId}" id="title"></a></li>
			    		<li id="writer_uid"></li>
			    		<li id="reg_date"></li>
			    		<li id="mod_date"></li>
			    		<li id="view_count" class="view_count"></li>
			    		<li id="fixed_yn" class="fixed_yn"></li>
			    		<li><button type="button">삭제</button></li>
			    	</ul>
    	
		            <!-- 공지사항 title 열 -->
		            <ul class="title_row ">
		            	<c:if test="${loginMember.uid == 'admin'}">
		            	<li class="check">
		            		<div class="select_all_container">
					            <label for="select_all_checkbox"></label>
					            <input type="checkbox" id="select_all_checkbox" onclick="checkSelectAll()"/>
					        </div>
		            	</li>
		            	</c:if>
		                <li class="noticeId">번호</li>
		                <li class="title">제목</li>
		                <li>작성자</li>
		                <li>작성일</li>
		                <li>수정일</li>
		                <li class="view_count">조회수</li>
		                <c:if test="${loginMember.uid == 'admin'}">
		                <li class="fixed_yn">고정여부</li>
		                </c:if>
		                <li>삭제</li>
		            </ul>
            	
            		<div id="noticeList">
		            <!-- 게시글 추가로 들어오는 위치 -->
		            <c:forEach var="notice" items="${result.noticeList}">
	                <ul class="board_row">
	                	<c:if test="${loginMember.uid == 'admin'}">
	                    <li class="check">
	                    	<input type="checkbox" class="item" name="delete_checkbox" value="${notice.noticeId}" onclick="checkSelect()"/>
	                    </li>
	                    </c:if>
	                    <li class="noticeId"><a href="noticeView.do?noticeId=${notice.noticeId}">${notice.noticeId}</a></li>
	                    <li class="title"><a href="noticeView.do?noticeId=${notice.noticeId}">${notice.title}</a></li>
	                    <li><a href="noticeView.do?noticeId=${notice.noticeId}">${notice.writer_uid}</a></li>
	                    <li>${notice.reg_date}</li>
	                    <li>${notice.mod_date}</li>
	                    <li class="view_count">${notice.view_count}</li>
	                	<c:if test="${loginMember.uid == 'admin'}">
		                <li class="fixed_yn">${notice.fixed_yn}</li>
		                <li><button type="button" value="${notice.noticeId}">삭제</button></li>
		                </c:if>
	                </ul>
		            </c:forEach>
            
		            <c:if test="${empty result.noticeList}">
		            	<ul>
		            		<li class="search">검색결과가 없습니다</li>
		             	</ul>
		            </c:if>
		            </div>
       			</div>
	        
	        <div style="text-align: center;margin-top:20px;">
	           	<c:if test="${result.notice.navStart != 1}">
	           		<a href="javascript:jsPageNo(${result.notice.navStart-1})" style="padding: 10px;border: 1px solid black;"> &lt; </a> 
	           	</c:if>
	           	<c:forEach var="item" begin="${result.notice.navStart}" end="${result.notice.navEnd}">
	           		<c:choose>
	           			<c:when test="${result.notice.pageNo != item }">
	           				<a href="javascript:jsPageNo(${item})" style="padding: 10px;border: 1px solid black;">${item}</a>  
	           			</c:when>
	           			<c:otherwise>
	           				<strong style="font-size:2rem; padding: 7px;">${item}</strong>   
	           			</c:otherwise>
	           		</c:choose>
	           	</c:forEach>
	           	<c:if test="${result.notice.navEnd != result.notice.totalPageSize}">
	           		<a href="javascript:jsPageNo(${result.notice.navEnd+1})" style="padding: 10px;border: 1px solid black;"> &gt; </a> 
	           	</c:if>
           	
           	</div>
	           	
	        <div class="delete-container">
	    		<c:if test="${loginMember.uid == 'admin'}">
	    			<button class="delete" type="button" id="deleteBtn">삭제</button>
	    		</c:if>
	    	</div> 

    	</form>
    </div>
    
    <form name="mForm" id="mForm" method="post" action="<c:url value='/notice/noticeView.do'/>">
       	<input type="hidden" id="noticeId" name="noticeId"/>
    </form>  
       
<script src="../js/checkbox.js"></script>       
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

$(document).ready(function() {
	$("#writeButton").click(function() {
        $("#writeModal").dialog({
            modal: true,
            width: 700,
            height: 500,
            buttons: {
                "작성": function() {
                    // 작성 버튼을 눌렀을 때 처리하는 로직 추가
                    $("#writeForm").submit();
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
    });
	
});


$("#writeForm").submit(function(e) {
	//이벤트 핸들러의 기본 동작을 취소한다
	e.preventDefault();
	const title = document.querySelector("#writeTitle");
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

<script type="text/javascript">
//공지사항 삭제
document.querySelector("#deleteBtn").addEventListener("click", e => {
 	e.preventDefault();
 	const noticeList = document.querySelector("#noticeList");
 	let ids = [];
 	const items = document.querySelectorAll(".item:checked");
 	
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
		noticeId: document.querySelector("#noticeList ul:last-child li:first-child input[type='checkbox']").value,
	};
 	
 	fetch("<c:url value='/notice/deleteNotices.do'/>", {
	    method: "POST",
	    headers: {
	        "Content-Type": "application/json; charset=UTF-8",
    },
    body: JSON.stringify(param),
	})
	.then((response) => response.json())
	.then((json) => {
	    if (json.status) {
	        //서버에서 공지사항 삭제 됨
	        //1. 화면 부분에 있는 자료를 삭제
			//삭제 함수 
			for (let i=items.length-1; i>=0; i--) {
				noticeList.removeChild(items[i].parentNode.parentNode);
			}
			//2. 서버에서 삭제 건수만큼 얻는 공지사항 목록을 출력한다
			const noticeListJson = json.noticeList;
			const noticeItem = document.querySelector("#noticeItem");
			    	  
			for (let i=0;i<noticeListJson.length;i++) {
		      	  const notice = noticeListJson[i];
		      	  const newNoticeItem = noticeItem.cloneNode(true);
				  const title = newNoticeItem.querySelector("#title");
			
				  newNoticeItem.querySelector("#noticeId").innerText = notice.noticeId; 
		     	  title.innerText = notice.title;
		     	  newNoticeItem.querySelector("#writer_uid").innerText = notice.writer_uid; 
		     	  newNoticeItem.querySelector("#reg_date").innerText = notice.reg_date;
		     	  newNoticeItem.querySelector("#mod_date").innerText = notice.mod_date; 
		     	  newNoticeItem.querySelector("#view_count").innerText = notice.view_count; 
		     	  newNoticeItem.querySelector("#fixed_yn").innerText = notice.fixed_yn; 
		     	  
		     	  //이벤트 핸들링 
		     	  newNoticeItem.querySelector(".item").value = notice.noticeId;
		     	  newNoticeItem.querySelector(".item").addEventListener("click", e => checkSelect());
		     	 // 현재 공지와 관련된 체크박스를 선택하기 위해 고유 식별자를 사용
		     	 //const checkbox = newNoticeItem.querySelector(`.item[value="${notice.noticeId}"]`);
		     	 //if (checkbox) {
		     	 //    checkbox.addEventListener("click", e => checkSelect());
		     	 //}
		     	 
		     	  newNoticeItem.style.display = "";
		     	  noticeList.appendChild(newNoticeItem);
			} 
	   	  
	    } else {
	    	alert(json.message);
	    }
	});
 	
 	return false;
});
</script>
    </body>
</html>