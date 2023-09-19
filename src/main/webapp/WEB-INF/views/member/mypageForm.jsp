<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>    

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>마이페이지</title>
  <link rel="stylesheet" href="<c:url value='/css/mypageForm.css'/>">

</head>
<body>
  
    <div id="mypage">
      <h1>마이페이지</h1>
        
      <div id="icon">
        <ul>
          <li><a href="#"><img src="../images/user.png"></a></li>
          <li><span><b>${loginMember.uid}</b> 님</span></li>
        </ul>
      </div>
      <div id="button_find">
        <ul id="buttonMenu">
          <li><a id="memberInfoButton" href="#">회원정보 상세보기</a></li>
          <c:if test="${loginMember.uid == 'admin'}">
          	<li><a id="allMemberInfoButton" href="memberList.do">전체회원정보 상세보기</a></li>
          </c:if>
          <li><a id="updateMemberInfoButton" href="#">회원정보 수정</a></li>
          <li class="logout"><a href="#" onclick="jsLogout()">로그아웃</a></li>
          <li class="deleteMember"><a id="deleteButton" href="#">회원 탈퇴</a></li>
        </ul> 
      </div>
      
    </div>
    
    <!-- 회원정보 상세보기 팝업창 -->
	<div class="popup-overlay" id="infoPopupOverlay"></div>
	<div class="popup-content" id="infoPopupContent">
	  <h2>회원정보 상세보기</h2>
	  <div class="info-box">
	    <p><b>"${sessionScope.loginMember.uid}"</b> 님의 정보</p>
	  </div>
	  
	  <!-- 회원 정보 출력 -->
	  <div class="info-details">
	    <p><b>이름 : </b>${loginMember.name}</p>
	    <p><b>비밀번호 : </b>${loginMember.password}</p>
	    <p><b>전화번호 : </b>${loginMember.phone}</p>
	  </div>
	  <div class="button-container">
	    <button class="close-button" onclick="hideInfoPopup()">닫기</button>
	  </div>
	</div>

	<!-- 회원정보 수정 팝업창 -->
	<div class="popup-overlay" id="editPopupOverlay"></div>
	<div class="popup-content" id="editPopupContent">
	  <h2>회원정보 수정</h2>
	  <p>※수정하고 싶지 않은 정보는 그대로 두기※</p>
	  <form action="update.do" id="mForm" method="post">
	  
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
	   
	    <div class="button-container">
	      <button type="submit" class="save-button">수정</button>
	      <button type="button" class="cancel-button" onclick="hideEditPopup()">취소</button>
	    </div>
	    
	  </form>
	</div>
	
	
    <!-- 회원탈퇴 팝업창 -->
    <div class="popup-overlay" id="popupOverlay"></div>
    <div class="popup-content" id="popupContent">
      <h2>회원탈퇴</h2>
      <p>정말로 탈퇴하시겠습니까?</p>
      <div class="button-container">
        <button class="yes-button" onclick="deleteConfirm(true)">Yes</button>
        <button class="no-button" onclick="deleteConfirm(false)">No</button>
      </div>
    </div>

 
<script src="../js/memberInfo.js"></script>
<script src="../js/updateMemberInfo.js"></script>
<script src="../js/deleteMember.js"></script>
<script type="text/javascript">
//로그아웃
function jsLogout() {
    fetch("logout.do", {
        method: "GET",
        headers: {
          "Content-Type": "application/json; charset=UTF-8",
        },
      })
      .then((response) => response.json())
      .then((json) => {
         alert(json.message);
         location.href = '<c:url value="/member/main.do"/>'; 
      });
}

//수정
document.querySelector("#mForm").addEventListener("submit", e => {
	e.preventDefault();  // 폼의 기본 제출 동작을 중단
	
    const param = {
			uid: "${loginMember.uid}",
			name: newName.value, 
	        password: newPassword.value,
	        phone: newPhone.value 
	};
	
	fetch("update.do", {
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
	        location.href='<c:url value="mypageForm.do"/>';  // 수정 성공 시 마이페이지로 이동
	      }
	
		  
	});
		
})

//삭제
function deleteConfirm(confirm) {
    if (confirm) {
        const param = {
            uid: "${loginMember.uid}"
        };

        fetch("delete.do", {
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
                location.href = '<c:url value="main.do"/>'; // 삭제 성공 시 로그아웃 후 홈페이지로 이동
            } else {
                // 삭제 실패 시 필요한 처리
            }
        });
    } else {
        // "No" 버튼 클릭 시
    	//팝업창 숨기기
    	hidePopup();
    }
}
</script>
</body>
</html>