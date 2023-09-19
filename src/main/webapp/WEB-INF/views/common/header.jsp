<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<link rel="stylesheet" href="<c:url value='/resources/css/loginForm.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/insertForm.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/mypageForm.css'/>">

    <header>
      <div id="logo">
        <a href="<c:url value='/main.do'/>">
          <h1>Four Seasons</h1>
        </a>
      </div>
      <nav1>
        <ul id="topMenu1">
        	<c:choose>
			    <c:when test="${not empty loginMember}">
			        <li id="loggedInMember">
			          <span><b><c:out value="${loginMember.id}" /></b> 님</span>
			        </li>
			        <li id="logoutBtn"><a href="#">로그아웃</a></li>
			        <li id="updateInfoBtn"><a href="#">마이페이지</a></li>
		     	</c:when>
		        <c:otherwise>
			        <li id="loginBtn"><a href="#">로그인</a></li>
			        <li id="insertBtn"><a href="#">회원가입</a></li>
		        </c:otherwise>
	    	</c:choose>
        </ul> 
      </nav1>
    
      <nav2>
        <ul id="topMenu2">
          <li><a href="#">호텔 & 리조트 </a>
            <ul>
              <li><a href="#">수영장</a></li>
              <li><a href="#">스파</a></li>
              <li><a href="#">루프탑 bar</a></li>
              <li><a href="#">피트니스</a></li>
            </ul> 
          </li>
          <li><a href="#">펜션 </a>
            <ul>
              <li><a href="#">바베큐장</a></li>
              <li><a href="#">애완동물 동반</a></li>
              <li><a href="#">키즈존</a></li>
            </ul>
          </li>
          <li><a href="#">캠핑 </a>
            <ul>
              <li><a href="#">글램핑</a></li>
              <li><a href="#">카라반</a></li>
              <li><a href="#">오토캠핑</a></li>
            </ul>
          </li>
          <li><a href="#">레저 & 엑티비티</a>
            <ul>
              <li><a href="#">놀이공원</a></li>
              <li><a href="#">워터파크</a></li>
              <li><a href="#">패러글라이딩</a></li>
              <li><a href="#">수상스포츠</a></li>
            </ul>
          </li>
          <li><a href="#">더보기 </a>
            <ul>
              <li><a href="<c:url value='/notice/noticeList.do'/>">공지사항</a></li>
              <li><a href="<c:url value='/board/boardList.do'/>">게시판</a></li>
            </ul>
          </li>
        </ul>
      </nav2>
    </header>


<!-- ====================회원가입 모달창 =============================== -->
<div id="insertForm" class="insert" title="회원가입" style="display:none">
	<form method="post"> 
	    <div class="uid">
	      <label for="uid">아이디</label>
	      <input type="button" id="existUid" value="중복확인"/><br>
	      <input id="uid" type="text" name="uid" size="40" placeholder="소문자와 숫자를 포함한 4글자 이상 입력" required/>
	      <div id="uid-error" class="error-message"></div>
	    </div>
	    
	    <div class="name">
	      <label for="name">이름</label><br>
	      <input id="uname" type="text" name="name" required/>
	      <div id="name-error" class="error-message"></div>
	    </div>
	
	    <div class="password">
	      <label for="password">비밀번호</label><br>
	      <input id="password" type="password" name="password" required/>
	      <div id="password-error" class="error-message"></div>
	    </div>
	    
	    <div class="passwordCheck">
	      <label for="passwordCheck">비밀번호 확인</label><br>
	      <input id="passwordCheck" type="password" name="passwordCheck" required/>
	      <div id="passwordCheck-error" class="error-message"></div>
	    </div>
	    
	    <div class="phone">
	      <label for="phone">전화번호</label><br>
	      <input id="phone" type="tel" name="phone" required/>
	      <div id="phone-error" class="error-message"></div>
	    </div>
	    
	    <div class="email">
	      <label for="email">이메일</label><br>
	      <input id="email" type="text" name="email" required/>
	      <div id="email-error" class="error-message"></div>
	    </div>
	    
	    <br/>
	    <div class="agree">
	 	  <label>약관동의  <input type="checkbox" value="Y" name="agree" id="agree" required> 약관에 동의합니다.</label>
	 	<div id="agree-error" class="error-message"></div>
	  </div>

</form>
</div>
    
<!-- ========================================================= -->

<!-- ====================로그인 모달창 ============================= -->
<div id="loginForm" class="login" title="로그인" style="display:none">
	<form method="post">
	<div class="uid">
		<label for="uid"></label>
		<input id="login_uid" type="text" name="uid" size="40" maxlength="8" placeholder="아이디" required/>
		<div id="uid-error" class="error-message"></div>
	</div>
	
	<div class="password">
		<label for="password"></label> 
		<input id="login_password" type="password" name="password" placeholder="비밀번호" required/>
		<div id="password-error" class="error-message"></div>
	</div>
	</form>
</div>
<!-- ========================================================== -->

<!-- ====================아이디찾기 모달창 =========================== -->
<div id="findIdForm" class="findId" title="아이디찾기" style="display:none">
	<form method="post">
        <div class="name">
          <label for="name">이름</label>
          <input id="findId_uname" type="text" name="name" placeholder="이름을 입력해주세요." required/>
          <div id="name-error" class="error-message"></div>
        </div>
        <div class="phone">
          <label for="phone">전화번호</label> 
          <input id="findId_phone" type="tel" name="phone" placeholder="전화번호을 입력해주세요." required/>
          <div id="phone-error" class="error-message"></div>
        </div>
     </form>
</div>
<!-- =========================================================== -->

<!-- ====================비밀번호찾기 모달창 ========================== -->
<div id="findPasswordForm" class="findPassword" title="비밀번호찾기" style="display:none">
	<form method="post">
        <div class="uid">
          <label for="uid">아이디</label>
          <input id="findPassword_uid" type="text" name="uid" size="40" placeholder="아이디를 입력해주세요." required/>
          <div id="uid-error" class="error-message"></div>
        </div>
        <div class="name">
          <label for="name">이름</label> 
          <input id="findPassword_uname" type="text" name="name" placeholder="이름을 입력해주세요." required/>
          <div id="name-error" class="error-message"></div>
        </div>
        <div class="phone">
          <label for="phone">전화번호</label> 
          <input id="findPassword_phone" type="tel" name="phone" placeholder="전화번호를 입력해주세요." required/>
          <div id="phone-error" class="error-message"></div>
        </div>
      </form>
</div>
<!-- ============================================================ -->

<!-- ====================마이페이지 모달창 ============================= -->
<div id="mypageForm" title="마이페이지" style="display:none">
	<div id="icon">
	  <ul>
	    <li><a href="#"><img src="<c:url value='/resources/images/user.png'/>"></a></li>
	    <li><span><b>${loginMember.id}</b> 님</span></li>
	  </ul>
	</div>
	<div id="button_find">
	  <ul id="buttonMenu">
	    <li><a id="memberInfoButton" href="#">회원정보 상세보기</a></li>
	    <c:if test="${loginMember.id == 'admin'}">
	    	<li><a id="allMemberInfoButton" href="#">전체회원정보 상세보기</a></li>
	    </c:if>
	    <li><a id="updateMemberInfoButton" href="#">회원정보 수정</a></li>
	    <li class="deleteMember"><a id="deleteButton" href="#">회원 탈퇴</a></li>
	  </ul> 
	</div>
</div>
<!-- ============================================================= -->

<!-- ====================회원정보 상세보기 모달창 ========================= -->
<div id="memberInfoForm" title="회원정보 상세보기" style="display:none">
	<div class="info-box">
	    <p><b>"${loginMember.id}"</b> 님의 정보</p>
	</div>
	  
	<!-- 회원 정보 출력 -->
	<table class=info-details>
	    <tr class="info">
	        <td><b>이름</b></td>
	        <td><b>비밀번호</b></td>
	        <td><b>전화번호</b></td>
	        <td><b>이메일</b></td>
	    </tr>
	    <tr>
	        <td>${loginMember.name}</td>
	        <td>${loginMember.password}</td>
	        <td>${loginMember.phone}</td>
	        <td>${loginMember.email}</td>
	    </tr>
	</table>
</div>	  
<!-- ============================================================== -->

<!-- ====================회원정보 수정 모달창 ============================= -->
<div id="memberUpdateForm" title="회원정보 수정" style="display:none">
	<p><b>${loginMember.id}</b> 님의 정보</p>
	
	<form method="post">
		<div class="newName">
			<label for="newName">이름</label>
			<input type="text" id="newName" name="newName" value="${loginMember.name}">
			<div id="newName-error" class="error-message"></div>
		</div>
		
		<div class="newPassword">
			<label for="newPassword">비밀번호</label>
			<input type="password" id="newPassword" name="newPassword" value="${loginMember.password}">
			<div id="newPassword-error" class="error-message"></div>
		</div>
		
		<div class="newPasswordCheck">
			<label for="newPasswordCheck">비밀번호 확인</label>
			<input type="password" id="newPasswordCheck" name="newPasswordCheck" value="${loginMember.password}">
			<div id="newPasswordCheck-error" class="error-message"></div>
		</div>
		
		<div class="newPhone">
			<label for="newPhone">전화번호</label>
			<input type="text" id="newPhone" name="newPhone" value="${loginMember.phone}">
			<div id="newPhone-error" class="error-message"></div>
		</div>
		
		<div class="newEmail">
			<label for="newEmail">이메일</label>
			<input type="text" id="newEmail" name="newEmail" value="${loginMember.email}">
			<div id="newEmail-error" class="error-message"></div>
		</div>
	</form>
	
</div>
<!-- ============================================================== -->

<!-- ====================회원탈퇴 모달창 =============================== -->
<div id="deleteForm" class="deleteForm" title="회원탈퇴" style="display:none">
	<p>정말로 탈퇴하시겠습니까?</p>
</div>
<!-- ============================================================== -->

<!-- ====================회원목록 모달창 =============================== -->


<!-- ============================================================== -->

<script src="<c:url value='/resources/js/blankCheck.js'/>"></script>
   
<script type="text/javascript">

//모달창 스크립트
$(document).ready(function() {
	//회원가입===========================================================
	//아이디중복검사
	let existUidChecked = false;

	$("#existUid").click(function() {
	    const uid = $("#uid").val();
	    const param = { id: uid };
		console.log("아이디중복검사: " + uid);
	    $.ajax({
	        type: "POST",
	        url: "<c:url value='/member/existUid.do'/>",
	        contentType: "application/json; charset=UTF-8",
	        data: JSON.stringify(param),
	        dataType: "json",
	        success: function(json) {
	            alert(json.message);
	            if (json.status) {
	                $("#uid").val("");
	                $("#uid").focus();
	                existUidChecked = false;
	            } else {
	                existUidChecked = true;
	            }
	        },
	        error: function() {
	            alert("AJAX 요청 중 오류가 발생했습니다.");
	        }
	    });
	});
	
	//회원가입
	$("#insertBtn").click(function() {
		$("#insertForm").dialog({
			autoOpen: false,
			modal: true,
			width: 450,
			height: 700,
			buttons: {
				"회원가입": function() {
					const uid = $("#uid").val();
				    const uname = $("#uname").val();
				    const password = $("#password").val();
				    const phone = $("#phone").val();
				    const email = $("#email").val();

				 	// 필수 정보가 누락된 경우
				    if (!uid || !uname || !password || !passwordCheck || !phone || !email) {
				        alert("모든 정보를 입력해주세요.");
				        return;
				    }
				 
				    if (!existUidChecked) {
				        alert("아이디 중복을 확인 해주세요");
				        $("#uid").focus();
				        return;
				    }

				    const param = {
				        id: uid,
				        name: uname,
				        password: password,
				        phone: phone,
				        email: email
				    };
				    
				    $.ajax({
				        type: "POST",
				        url: "<c:url value='/member/insert.do'/>",
				        contentType: "application/json; charset=UTF-8",
				        data: JSON.stringify(param),
				        dataType: "json",
				        success: function(json) {
				            alert(json.message);
				            if (json.status) {
				                location.href = '<c:url value="/main.do"/>';
				            } else {
	                            $("#insertForm").dialog("close"); // 회원가입 실패 시 모달 창 닫기
	                        }
				        },
				        error: function() {
				            alert("회원가입에 필요한 정보를 모두 입력해주세요.");
				        }
				    });
                },
				"닫기": function() {
					$(this).dialog("close");
				}
			},
			close: function() {
				 // 모달 창 닫기 시 초기화
                   $("#insertForm form")[0].reset();
                   $("#uid-error").text(""); // 에러 메시지 초기화
                   $("#name-error").text(""); // 에러 메시지 초기화
                   $("#password-error").text(""); // 에러 메시지 초기화
                   $("#passwordCheck-error").text(""); // 에러 메시지 초기화
                   $("#phone-error").text(""); // 에러 메시지 초기화
                   $("#email-error").text(""); // 에러 메시지 초기화
			}
		});
		
		// 회원가입 모달창 초기화 후 open ===============
		$("#insertForm").dialog("open");		
		//======================================
	});
	//==================================================================
	
	//로그인, 아이디 찾기, 비밀번호찾기===========================================
	$("#loginBtn").click(function() {
		$("#loginForm").dialog({
			autoOpen: false,
			modal: true,
			width: 400,
			height: 310,
			buttons: {
				"로그인": function() {
					var uid = $("#login_uid").val();
				    var password = $("#login_password").val();

				    var param = {
				        id: uid,
				        password: password
				    };
                    $.ajax({
                        type: "POST",
                        url: "<c:url value='/member/login.do'/>", 
                        data: JSON.stringify(param),
                        contentType: "application/json; charset=UTF-8",
                        dataType: "json",
                        success: function(json) {
                     	    alert(json.message);
	                        if (json.status) {
	                            location.href = '<c:url value="/main.do"/>';
	                        }
	                    },
	                    error: function() {
	                        // AJAX 요청 실패 시 에러 처리
	                        alert("아이디나 비밀번호가 입력되지 않았습니다.");
	                    }
                	});
				},
				"아이디찾기": function() {
					$("#findIdForm").dialog({
			            autoOpen: false,
			            modal: true,
			            width: 400,
			            height: 300,
			            buttons: {
			                "아이디찾기": function() {
			                	var uname = $("#findId_uname").val();
							    var phone = $("#findId_phone").val();

							    var param = {
							        name: uname,
							        phone: phone
							    };
							    $.ajax({
							        type: "POST",
							        url: "<c:url value='/member/findId.do'/>", 
							        data: JSON.stringify(param),
							        contentType: "application/json; charset=UTF-8",
							        dataType: "json",
							        success: function(json) {
							     	    alert(json.message);
								        if (json.status) {
								        	location.href = '<c:url value="/main.do"/>';
								        }
								    },
								    error: function() {
								        // AJAX 요청 실패 시 에러 처리
								        alert("아이디찾기에 필요한 정보를 모두 입력해주세요.");
								    }
								});
							},
			                "닫기": function() {
			                    $(this).dialog("close");
			                    $("#loginForm").dialog("open");
			                }
			            },
			            close: function() {
			                // 모달 창 닫기 시 초기화 작업 수행
			                $("#findIdForm form")[0].reset();
			                $("#name-error").text(""); // 에러 메시지 초기화
			                $("#phone-error").text(""); // 에러 메시지 초기화
			            }
			        });

					// 아이디찾기 모달창 초기화 후 open ==============
					$("#loginForm").dialog("close");
			        $("#findIdForm").dialog("open");
			        //======================================
				},
				"비밀번호찾기": function() {
					$("#findPasswordForm").dialog({
			            autoOpen: false,
			            modal: true,
			            width: 400,
			            height: 380,
			            buttons: {
			                "비밀번호찾기": function() {
			                	var uid = $("#findPassword_uid").val();
			                	var uname = $("#findPassword_uname").val();
							    var phone = $("#findPassword_phone").val();

							    var param = {
							    	id: uid,
							        name: uname,
							        phone: phone
							    };
							    $.ajax({
							        type: "POST",
							        url: "<c:url value='/member/findPassword.do'/>", 
							        data: JSON.stringify(param),
							        contentType: "application/json; charset=UTF-8",
							        dataType: "json",
							        success: function(json) {
							     	    alert(json.message);
								        if (json.status) {
								        	location.href = '<c:url value="/main.do"/>';
								        }
								    },
								    error: function() {
								        // AJAX 요청 실패 시 에러 처리
								        alert("비밀번호찾기에 필요한 정보를 모두 입력해주세요.");
								    }
								});
							},
			                "닫기": function() {
			                    $(this).dialog("close");
			                    $("#loginForm").dialog("open");
			                }
			            },
			            close: function() {
			                // 모달 창 닫기 시 초기화 작업 수행
			                $("#findPasswordForm form")[0].reset();
			                $("#uid-error").text(""); // 에러 메시지 초기화
			                $("#name-error").text(""); // 에러 메시지 초기화
			                $("#phone-error").text(""); // 에러 메시지 초기화
			            }
			        });
					
					// 비밀번호 찾기 초기화 후 open =================
					$("#loginForm").dialog("close");
			        $("#findPasswordForm").dialog("open");
					//======================================
				}
			},
			close: function() {
				 // 모달 창 닫기 시 초기화
                   $("#loginForm form")[0].reset();
                   $("#uid-error").text(""); // 에러 메시지 초기화
                   $("#password-error").text(""); // 에러 메시지 초기화
			}
		});
		
		// 로그인 모달창 초기화 후 open ================
		$("#loginForm").dialog("open");
		//======================================
	});
	
		
	
	//로그아웃===========================================================
	$("#logoutBtn").click(function() {
	    $.ajax({
	        type: "POST",
	        url: "<c:url value='/member/logout.do'/>", 
	        success: function(json) {
	            alert("로그아웃되었습니다.");
	            location.href = '<c:url value="/main.do"/>'; // 로그아웃 후 메인 페이지로 이동
	        },
	        error: function() {
	            alert("로그아웃 요청 중 오류가 발생했습니다.");
	        }
	    });
	});
	
	
	//마이페이지===========================================================
	$("#updateInfoBtn").click(function() {
	    $("#mypageForm").dialog({
	        autoOpen: false,
	        modal: true,
	        width: 400,
	        height: 400,
	        buttons: {
	            "닫기": function() {
	                $(this).dialog("close");
	            }
	        },
	        close: function() {
	            // 모달 창 닫기 시 초기화 작업 수행
	        }
	    });

	    // 마이페이지 모달창 열기
	    $("#mypageForm").dialog("open");
	});
	
	//회원정보 상세보기======================================================
	$("#memberInfoButton").click(function() {
		$("#memberInfoForm").dialog({
			autoOpen: false,
	        modal: true,
	        width: 600,
	        height: 400,
	        buttons: {
	            "닫기": function() {
	                $(this).dialog("close");
	            }
	        },
	        close: function() {
	            // 모달 창 닫기 시 초기화 작업 수행
	        }
	    });

	    // 회원정보 상세보기 모달창 열기====================
	    $("#memberInfoForm").dialog("open");
	    //========================================
	});
	
	//회원정보 수정======================================================
	$("#updateMemberInfoButton").click(function() {
		// 현재 사용자 정보로 필드 채우기
        $("#newName").val("${loginMember.name}");
        $("#newPassword").val("${loginMember.password}");
        $("#newPasswordCheck").val("${loginMember.password}");
        $("#newPhone").val("${loginMember.phone}");
        $("#newEmail").val("${loginMember.email}");
		
        //모달창 초기화
		$("#memberUpdateForm").dialog({
			autoOpen: false,
	        modal: true,
	        width: 500,
	        height: 650,
	        buttons: {
	        	"회원정보 수정": function() {
	        		const newName = $("#newName").val();
                    const newPassword = $("#newPassword").val();
                    const newPasswordCheck = $("#newPasswordCheck").val();
                    const newPhone = $("#newPhone").val();
                    const newEmail = $("#newEmail").val();
					
                 	// 필수 정보가 누락된 경우
				    if (!newName || !newPassword || !newPasswordCheck || !newPhone || !newEmail) {
				        alert("모든 정보를 입력해주세요.");
				        return;
				    }
                 
				    const param = {
				    		id: "${loginMember.id}",
	                        name: newName,
	                        password: newPassword,
	                        phone: newPhone,
	                        email: newEmail,
			    	};

			    	$.ajax({
			    	    type: "POST",
			    	    url: "<c:url value='/member/update.do'/>",
			    	    contentType: "application/json; charset=UTF-8",
			    	    data: JSON.stringify(param),
			    	    dataType: "json",
			    	    success: function (json) {
			    	        alert(json.message);
			    	        if (json.status) {
			    	            location.href = '<c:url value="/main.do"/>'; // 수정 성공 시 마이페이지로 이동
			    	        }
			    	    },
			    	    error: function () {
			    	        alert("AJAX 요청 중 오류가 발생했습니다.");
			    	    }
			    	});
					
			    	$(this).dialog("close");
	        	},	
	            "닫기": function() {
	                $(this).dialog("close");
	            }
	        },
	        close: function() {
	        	$("#memberUpdateForm form")[0].reset();
                $(".error-message").text("");
	        }
	    });

	    // 회원정보 수정 모달창 열기====================
	    $("#memberUpdateForm").dialog("open");
	    //========================================
	});
	
	//회원탈퇴======================================================
	$("#deleteButton").click(function () {
        $("#deleteForm").dialog({
            autoOpen: false,
            modal: true,
            width: 400,
            buttons: {
                "Yes": function () {
                	const loginMemberId = "${loginMember.id}";
                	
                    // "Yes" 버튼 클릭 시
                    const param = {
                        id: loginMemberId
                    };
                    console.log(loginMemberId);
                    $.ajax({
                        type: "POST",
                        url: "<c:url value='/member/delete.do'/>", 
                        contentType: "application/json; charset=UTF-8",
                        data: JSON.stringify(param),
                        dataType: "json",
                        success: function (json) {
                            alert(json.message);
                            if (json.status) {
                                location.href = '<c:url value="/main.do"/>'; // 삭제 성공 시 로그아웃 후 홈페이지로 이동
                            } else {
                                // 삭제 실패 시 필요한 처리
                            }
                        },
                        error: function () {
                            alert("AJAX 요청 중 오류가 발생했습니다.");
                        }
                    });
                 	// 모달 창 닫기
                    $(this).dialog("close");
                 
                },
                "No": function () {
                    // "No" 버튼 클릭 시 모달 창 닫기
                    $(this).dialog("close");
                }
            }
        });
        $("#deleteForm").dialog("open");
    });
});	
</script>
	
