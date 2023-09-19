<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no'>

<title>Insert title here</title>

<c:url var="cssUrl" value="/css/insertForm.css"/>
<link rel="stylesheet" href="${cssUrl}"/>

</head>
<body>
  
    <!-- onsubmit="return validateForm()" -->
    <div class="insert">
      
      <form action="insert.do" method="post" onsubmit="return false;"> 
        <h1>회원가입</h1>

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
        
        <br/>
        <div class="agree">
		  <label>약관동의  <input type="checkbox" value="Y" name="agree" id="agree" required> 약관에 동의합니다.</label>
		  <div id="agree-error" class="error-message"></div>
		</div>
		<br/>
      
      <hr/>
      
        <div class="insert_button">
          <input type="submit" id="register" value="회원가입"/>
        </div>

      </form>
      
    </div>
    
  
<script src="../js/insert.js"></script>
<script type="text/javascript">
let existUidChecked = false;
document.querySelector("#existUid").addEventListener("click", e => {
	const param = {uid: uid.value};

	      fetch("existUid.do", {
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
	         	   uid.value = "";
	         	   uid.focus();
	     	       existUidChecked = false;
	          } else {
	       	   existUidChecked = true;
	          }
	       });
});

document.querySelector("#register").addEventListener("click", e => {
	if (!existUidChecked) {
		alert("아이디 중복을 확인 해주세요");
		existUid.focus();
		return;
	}
    const param = {
	        uid: uid.value,
	        name: uname.value,
	        password: password.value,
	        phone: phone.value,
	      };

	      fetch("insert.do", {
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
	        	  location.href = "loginForm.do"; 
	          }
	      });
	
});

</script>
</body>
</html>
