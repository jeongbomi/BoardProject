<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<link rel="stylesheet" href="<c:url value='/css/loginForm.css'/>">


</head>
<body>

    <div class="login">
      
      <form action="login.do" method="post" onsubmit="return false;">
        <h1>로그인</h1>
        
        <div class="uid">
          <label for="uid"></label>
          <input id="uid" type="text" name="uid" size="40" maxlength="8" placeholder="아이디" required/>
          <div id="uid-error" class="error-message"></div>
        </div>
        
        <div class="password">
          <label for="password"></label> 
          <input id="password" type="password" name="password" placeholder="비밀번호" required/>
          <div id="password-error" class="error-message"></div>
        </div>
        
        <div id="button">
          <input type="submit" id="login" value="로그인"/>
        </div>
        
      </form>
	  
      <div id="button_find">
        <ul id="buttonMenu">
          <li><a href="findIdForm.do">아이디 찾기</a></li>
          <li><a href="findPasswordForm.do">비밀번호 찾기</a></li>
          <li><a href="insertForm.do">회원가입</a></li>
        </ul> 
      </div>
      
    </div>
 
  
<script src="js/login.js"></script>
<script type="text/javascript">
document.querySelector("#login").addEventListener("click", e => {
    const param = {
	        uid: uid.value,
	        password: password.value
	};

    fetch("login.do", {
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
      	  location.href = '<c:url value="main.do"/>'; 
        }
    });
	
});

</script>

</body>
</html>