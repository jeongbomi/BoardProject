<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="<c:url value='/css/findPasswordForm.css'/>">

</head>
<body>

    <div class="findPassword">
      
      <form action="findPassword.do" method="post" onsubmit="return false;">
      	<h1>비밀번호 찾기</h1>
      	
        <div class="uid">
          <label for="uid">아이디</label>
          <input id="uid" type="text" name="uid" size="40" placeholder="아이디를 입력해주세요." required/>
          <div id="uid-error" class="error-message"></div>
        </div>
        <div class="name">
          <label for="name">이름</label> 
          <input id="uname" type="text" name="name" placeholder="이름을 입력해주세요." required/>
          <div id="name-error" class="error-message"></div>
        </div>
        <div class="phone">
          <label for="phone">전화번호</label> 
          <input id="phone" type="tel" name="phone" placeholder="전화번호를 입력해주세요." required/>
          <div id="phone-error" class="error-message"></div>
        </div>
        
        <div id="button">
          <input type="submit" id="findPassword" value="비밀번호 찾기"/>
        </div>
        
      </form>
      
      <div id="button_find">
        <ul id="buttonMenu">
          <li><a href="findIdForm.do">아이디 찾기</a></li>
          <li><a href="loginForm.do">로그인</a></li>
          <li><a href="insertForm.do">회원가입</a></li>
        </ul> 
      </div>
      
    </div>


<script src="../js/findPassword.js"></script>
<script type="text/javascript">
document.querySelector("#findPassword").addEventListener("click", e => {
    const param = {
    		uid: uid.value,
	        name: uname.value,
	        phone: phone.value
	};

    fetch("findPassword.do", {
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
      	  location.href = '<c:url value="loginForm.do"/>'; 
        }
    });
	
});

</script>

</body>
</html>