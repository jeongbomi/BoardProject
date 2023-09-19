<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link rel="stylesheet" href="<c:url value='/css/findIdForm.css'/>">

</head>
<body>

    <div class="findId">
      <h1>아이디 찾기</h1>
      <form action="findId.do" method="post" onsubmit="return false;">
        <div class="name">
          <label for="name">이름</label>
          <input id="uname" type="text" name="name" placeholder="이름을 입력해주세요." required/>
          <div id="name-error" class="error-message"></div>
        </div>
        <div class="phone">
          <label for="phone">전화번호</label> 
          <input id="phone" type="tel" name="phone" placeholder="전화번호을 입력해주세요." required/>
          <div id="phone-error" class="error-message"></div>
        </div>
        
        <div id="button">
          <input type="submit" id="findId" value="아이디 찾기"/>
        </div>
        
      
      </form>
      <div id="button_find">
        <ul id="buttonMenu">
          <li><a href="findPasswordForm.do">비밀번호 찾기</a></li>
          <li><a href="loginForm.do">로그인</a></li>
          <li><a href="insertForm.do">회원가입</a></li>
        </ul> 
      </div>
      
    </div>


<script src="../js/findId.js"></script>
<script type="text/javascript">
document.querySelector("#findId").addEventListener("click", e => {
    const param = {
	        name: uname.value,
	        phone: phone.value
	};

    fetch("findId.do", {
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