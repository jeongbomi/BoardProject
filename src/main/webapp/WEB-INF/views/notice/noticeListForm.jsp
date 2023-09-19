<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>    

<link rel="stylesheet" href="<c:url value='/resources/css/noticeForm.css' />">

    
    <div class="container">
	    <h1>공지사항 목록</h1>
	    
	    <div class="write-container">
	        <c:if test="${loginMember.id == 'admin'}">
	        	<button id="writeButton" class="write">글쓰기</button>
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
					<div class="containerSearch">
						<label for="pageLength">건수 : </label>
						<select name="pageLength" id="pageLength" >
							<option value="10" ${result.notice.pageLength == 10 ? 'selected="selected"' : ''} >10건</option>
							<option value="20" ${result.notice.pageLength == 20 ? 'selected="selected"' : ''} >20건</option>
							<option value="50" ${result.notice.pageLength == 50 ? 'selected="selected"' : ''} >50건</option>
							<option value="100" ${result.notice.pageLength == 100 ? 'selected="selected"' : ''} >100건</option>
						</select>
	
						<label for="searchTitle">제목 : </label>
						<input type="text" name="searchTitle" id="searchTitle" value="${result.notice.searchTitle}" style="flex:1">
						<input type="submit" value="검색" id="searchBtn"/>
					</div>
				</div>	
    	
		        <div class="notice_board">
		        
		        	<ul id="noticeItem" class="board_row" style="display:none">
			    		<li class="check">
	                    	<input type="checkbox" class="item"/>
	                    </li>
			    		<li id="noticeId" class="noticeId"></li>
			    		<li class="titleCheck"><a href="#" id="title"></a></li>
			    		<li id="writer_uid"></li>
			    		<li id="reg_date"></li>
			    		<li id="mod_date"></li>
			    		<li id="view_count" class="view_count"></li>
			    		<li id="fixed_yn" class="fixed_yn"></li>
			    		<li><button type="button">삭제</button></li>
			    	</ul>
    	
		            <!-- 공지사항 title 열 -->
		            <ul class="title_row ">
		            	<c:if test="${loginMember.id == 'admin'}">
		            	<li class="check">
		            		<div class="select_all_container">
					            <label for="select_all_checkbox"></label>
					            <input type="checkbox" id="select_all_checkbox" onclick="checkSelectAll()"/>
					        </div>
		            	</li>
		            	</c:if>
		                <li class="noticeId">번호</li>
		                <li class="titleCheck">제목</li>
		                <li>작성자</li>
		                <li>작성일</li>
		                <li>수정일</li>
		                <li class="view_count">조회수</li>
		                <c:if test="${loginMember.id == 'admin'}">
		                <li class="fixed_yn">고정여부</li>
		                <li>삭제</li>
		                </c:if>
		            </ul>
            	
            		<div id="noticeList">
		            <!-- 게시글 추가로 들어오는 위치 -->
		            <c:forEach var="notice" items="${result.noticeList}">
	                <ul class="board_row">
	                	<c:if test="${loginMember.id == 'admin'}">
	                    <li class="check">
	                    	<input type="checkbox" class="item" name="delete_checkbox" value="${notice.noticeId}" onclick="checkSelect()"/>
	                    </li>
	                    </c:if>
	                    <li class="noticeId"><a href="#">${notice.noticeId}</a></li>
	                    <li class="titleCheck"><a href="#" data-notice-id="${notice.noticeId}">${notice.title}</a></li>
	                    <li><a href="#">${notice.writer_uid}</a></li>
	                    <li>${notice.reg_date}</li>
	                    <li>${notice.mod_date}</li>
	                    <li class="view_count">${notice.view_count}</li>
	                	<c:if test="${loginMember.id == 'admin'}">
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
	    		<c:if test="${loginMember.id == 'admin'}">
	    			<button class="delete" id="deleteBtn" type="button">삭제</button>
	    		</c:if>
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
		<tr>
			<td colspan="2"><input type="checkbox" name="fixed_yn" id="fixed_yn">상단 고정 여부</td>
		</tr>
	</table>
</div>
<!-- ============================================================================= -->
   
<!-- 글 상세보기 ======================================================================== -->
<div id="viewForm" class="notice_detail" title="상세보기" style="display: none;">
    <table border="1">
        <tr>
            <td class="title">공지사항 번호</td>
            <td class="content detail-noticeId"></td>
            <td class="title">고정여부</td>
            <td class="content detail-fixed_yn"></td>
            <td class="title">조회수</td>
            <td class="content detail-view_count"></td>
        </tr>
        <tr>
            <td class="title">작성자</td>
            <td class="content detail-writer_uid"></td>
            <td class="title">작성일</td>
            <td class="content detail-reg_date"></td>
            <td class="title">수정일</td>
            <td class="content detail-mod_date"></td>
        </tr>
        <tr>
            <td class="title">제목</td>
            <td class="content detail-title" colspan="7"></td>
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
<div id="updateForm" title="공지사항 수정" style="display:none">
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
		<tr>
			<td colspan="2"><input type="checkbox" name="fixed_yn" id="updateFixed_yn">상단 고정 여부</td>
		</tr>
	</table>
</div>
<!-- ============================================================================= -->

<!-- 글삭제 ======================================================================== -->
<div id="deleteNoticeForm" class="deleteForm" title="공지사항 삭제" style="display:none">
	<p>해당 공지사항을 삭제하시겠습니까?</p>
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
//공지사항 삭제
document.querySelector("#deleteBtn").addEventListener("click", e => {
 	e.preventDefault();
 	const noticeList = document.querySelector("#noticeList");
 	let ids = [];
 	const items = document.querySelectorAll(".item:checked");
 	const noticeId = document.querySelector("#noticeList ul:last-child li:first-child input[type='checkbox']").value;
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
		noticeId: noticeId
	};
 	console.log(noticeId);
 	fetch("<c:url value='/notice/deleteNotices.do'/>", {
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

		     	 
		     	  newNoticeItem.style.display = "";
		     	  noticeList.appendChild(newNoticeItem);
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
                    const fixedYn = $("#fixed_yn:checked").length != 0 ? 'Y' : 'N';
                	
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
                        contents: contents.value,
                        fixed_yn: fixedYn
                    };
                	
                	fetch("<c:url value='/notice/insert.do'/>", {
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
                            location.href = "<c:url value='/notice/noticeList.do'/>";
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
	
	// 상세보기------------------------------------------------------------
	// 타이틀을 클릭했을 때 모달 창 열기
    $("#noticeList .board_row .titleCheck a").click(function(e) {
        e.preventDefault();
    	
        // 상세보기 모달창 초기화
    	$("#viewForm").dialog({
            modal: true,
            width: 1000,
            height: 500,
            buttons: {
            	"닫기": function() {
            		$(this).dialog("close");
            		location.href = "<c:url value='/notice/noticeList.do'/>";
            	}
            },
            close: function() {
            	location.href = "<c:url value='/notice/noticeList.do'/>";
            }

        });
    	
        const noticeId = $(this).data("notice-id");
        console.log("Clicked Notice ID:", noticeId);
        
        fetch("<c:url value='/notice/detail.do'/>", {
            method: "POST",
            headers: {
                "Content-Type": "application/json; charset=UTF-8"
            },
            body: JSON.stringify({ noticeId: noticeId })
        })
        .then(response => response.json())
        .then(data => {
            console.log("Response Data:", data);

            if (data.status) {
                const notice = data.notice;
                console.log("notice Data:", notice);

                $(".detail-noticeId").text(notice.noticeId);
                $(".detail-fixed_yn").text(notice.fixed_yn);
                $(".detail-writer_uid").text(notice.writer_uid);
                $(".detail-reg_date").text(notice.reg_date);
                $(".detail-mod_date").text(notice.mod_date);
                $(".detail-view_count").text(notice.view_count);
                $(".detail-title").text(notice.title);
                $(".detail-contents pre").text(notice.contents);

                $("#viewForm").dialog("open");
            }
        })
        });
    });
	
    //글 수정------------------------------------------------------------
    $("#detail-update").click(function(e) {
        e.preventDefault();
        
        const noticeId = $(".detail-noticeId").text();
        const title = $(".detail-title").text();
        const contents = $(".detail-contents pre").text();
        const fixedYn = $(".detail-fixed_yn").text();
     
     	// 수정 모달창에 정보 설정
        $("#updateTitle").val(title);
        $("#updateContents").val(contents);
        if (fixedYn === 'Y') {
            $("#updateFixed_yn").prop("checked", true);
        } else {
            $("#updateFixed_yn").prop("checked", false);
        }
        
        $("#updateForm").dialog({
	        modal: true,
            width: 700,
            height: 700,
            buttons: {
            	"수정": function() {
                    const updatedTitle = $("#updateTitle").val();
                    const updatedContents = $("#updateContents").val();
                    const updatedFixedYn = $("#updateFixed_yn").prop("checked") ? 'Y' : 'N';

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
                        noticeId: noticeId,
                        title: updatedTitle,
                        contents: updatedContents,
                        fixed_yn: updatedFixedYn
                    };

                 	// 수정 요청 보내기
                    fetch("<c:url value='/notice/update.do'/>", {
                        method: "POST",
                        headers: {
                            "Content-Type": "application/json"
                        },
                        body: JSON.stringify(param)
                    })
                    .then(response => response.json())
                    .then(json => {
                        alert(json.message);
                        if (json.status) {
                            location.href = "<c:url value='/notice/noticeList.do'/>";
                        }
                    })
                    .catch(error => {
                        console.error("Fetch error:", error);
                    });

                    $(this).dialog("close");
                },
                "취소": function() {
                    $(this).dialog("close");
                }
            }
        });
        
    });
    
    // 상세보기쪽에서
    // 글 삭제------------------------------------------------------------
    $("#detail-delete").click(function() {
    	$("#deleteNoticeForm").dialog({
            autoOpen: false,
            modal: true,
            width: 400,
            buttons: {
            	"Yes": function() {
                	const noticeId = $(".detail-noticeId").text();
                	
                	// "Yes" 버튼 클릭 시
                    const param = {
                    	noticeId: noticeId
                    };
                	
                    fetch("<c:url value='/notice/delete.do'/>", {
                        method: "POST",
                        headers: {
                            "Content-Type": "application/json"
                        },
                        body: JSON.stringify(param)
                    })
                    .then(response => response.json())
                    .then(json => {
                        alert(json.message);
                        if (json.status) {
                            location.href = "<c:url value='/notice/noticeList.do'/>";
                        } else {
                            // 삭제 실패 시 처리할 내용
                        }
                    })
                    .catch(error => {
                        console.error("Fetch error:", error);
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
    	$("#deleteNoticeForm").dialog("open");
    });
	
});

</script>
