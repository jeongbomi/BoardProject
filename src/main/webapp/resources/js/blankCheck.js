
//회원가입======================================================================
//아이디 확인
document.querySelector("#insertForm #uid").addEventListener("blur", checkId);

function checkId() {
	var uid = document.querySelector("#insertForm #uid").value;
	var errorMessage = document.querySelector("#insertForm #uid-error");
	
	var uidRegex = /^(?=.*[a-z])(?=.*\d).{4,}$/;
	if (!uidRegex.test(uid)) {
	    document.querySelector("#insertForm #uid").classList.add("error");
	    errorMessage.textContent = "아이디는 소문자와 숫자를 포함한 4글자 이상이어야 합니다.";
	    errorMessage.style.display = "block";
    } else {
        document.getElementById("#insertForm #uid").classList.remove("error");
		errorMessage.style.display = "none";
    }
	
}

// 이름확인
document.querySelector("#insertForm #uname").addEventListener("blur", checkName);

function checkName() {
	var name = document.querySelector("#insertForm #uname").value;
	var errorMessage = document.querySelector("#insertForm #name-error");
	
	if(name === ""){
	  	document.querySelector("#insertForm #uname").classList.add("error");
	  	errorMessage.textContent = "이름이 입력되지 않았습니다.";
	  	errorMessage.style.display = "block";
	}else{
	  	document.querySelector("#insertForm #uname").classList.remove("error");
	  	errorMessage.style.display = "none";
	}
}   

// 비밀번호 확인
document.querySelector("#insertForm #password").addEventListener("blur", checkPassword);

function checkPassword() {
	var password = document.querySelector("#insertForm #password").value;
	var errorMessage = document.querySelector("#insertForm #password-error");
	
	if(password === ""){
	  	document.querySelector("#insertForm #password").classList.add("error");
	  	errorMessage.textContent = "비밀번호가 입력되지 않았습니다.";
	  	errorMessage.style.display = "block";
	}else{
	  	document.querySelector("#insertForm #password").classList.remove("error");
	  	errorMessage.style.display = "none";
	}
}

//비밀번호 같은지 확인
document.querySelector("#insertForm #passwordCheck").addEventListener("blur", checkPasswordCheck);

function checkPasswordCheck() {
	var password = document.querySelector("#insertForm #password").value;
	var passwordCheck = document.querySelector("#insertForm #passwordCheck").value;
	var errorMessage = document.querySelector("#insertForm #passwordCheck-error");
	
	if(password !== passwordCheck) {
		document.querySelector("#insertForm #passwordCheck").classList.add("error");
		errorMessage.textContent = "비밀번호가 일치하지 않습니다.";
		errorMessage.style.display = "block";
	} else {
		document.querySelector("#insertForm #passwordCheck").classList.remove("error");
		errorMessage.style.display = "none";
	}
	
}

// 전화번호 확인
document.querySelector("#insertForm #phone").addEventListener("blur", checkPhone);

function checkPhone() {
	var phone = document.querySelector("#insertForm #phone").value;
	var errorMessage = document.querySelector("#insertForm #phone-error");
	
	if(phone === ""){
	  	document.querySelector("#insertForm #phone").classList.add("error");
	  	errorMessage.textContent = "전화번호가 입력되지 않았습니다.";
	  	errorMessage.style.display = "block";
	}else{
	  	document.querySelector("#insertForm #phone").classList.remove("error");
	  	errorMessage.style.display = "none";
	}
}

// 이메일 확인
document.querySelector("#insertForm #email").addEventListener("blur", checkEmail);

function checkEmail() {
	var email = document.querySelector("#insertForm #email").value;
	var errorMessage = document.querySelector("#insertForm #email-error");
	
	if(email === ""){
	  	document.querySelector("#insertForm #email").classList.add("error");
	  	errorMessage.textContent = "이메일이 입력되지 않았습니다.";
	  	errorMessage.style.display = "block";
	}else{
	  	document.querySelector("#insertForm #email").classList.remove("error");
	  	errorMessage.style.display = "none";
	}
} 

// 약관동의 확인
document.getElementById("agree").addEventListener("blur", checkAgree);

function checkAgree() {
	var agree = document.getElementById("agree");
	var errorMessage = document.getElementById("agree-error");
	
	if(!agree.checked){
	  	agree.classList.add("error");
	  	errorMessage.textContent = "약관동의가 체크되지 않았습니다.";
	  	errorMessage.style.display = "block";
	}else{
	  	agree.classList.remove("error");
	  	errorMessage.style.display = "none";
	}
}

//로그인==================================================================================
//아이디 확인
document.querySelector("#loginForm #login_uid").addEventListener("blur", checkLoginUid);

function checkLoginUid() {
	var uid = document.querySelector("#loginForm #login_uid").value;
	var errorMessage = document.querySelector("#loginForm #uid-error");
	
	if(uid === ""){
	  	document.querySelector("#loginForm #login_uid").classList.add("error");
	  	errorMessage.textContent = "아이디가 입력되지 않았습니다.";
	  	errorMessage.style.display = "block";
	}else{
	  	document.querySelector("#loginForm #login_uid").classList.remove("error");
	  	errorMessage.style.display = "none";
	}
}

//비밀번호 확인
document.querySelector("#loginForm #login_password").addEventListener("blur", checkLoginPassword);

function checkLoginPassword() {
	var password = document.querySelector("#loginForm #login_password").value;
	var errorMessage = document.querySelector("#loginForm #password-error");
	
	if(password === ""){
	  	document.querySelector("#loginForm #login_password").classList.add("error");
	  	errorMessage.textContent = "비밀번호가 입력되지 않았습니다.";
	  	errorMessage.style.display = "block";
	}else{
	  	document.querySelector("#loginForm #login_password").classList.remove("error");
	  	errorMessage.style.display = "none";
	}
}


//아이디찾기==================================================================================
//이름 확인
document.querySelector("#findIdForm #findId_uname").addEventListener("blur", checkFindIdName);

function checkFindIdName() {
	var name = document.querySelector("#findIdForm #findId_uname").value;
	var errorMessage = document.querySelector("#findIdForm #name-error");
	
	if(name === ""){
	  	document.querySelector("#findIdForm #findId_uname").classList.add("error");
	  	errorMessage.textContent = "이름이 입력되지 않았습니다.";
	  	errorMessage.style.display = "block";
	}else{
	  	document.querySelector("#findIdForm #findId_uname").classList.remove("error");
	  	errorMessage.style.display = "none";
	}
}  

//전화번호 확인
document.querySelector("#findIdForm #findId_phone").addEventListener("blur", checkFindIdPhone);

function checkFindIdPhone() {
	var phone = document.querySelector("#findIdForm #findId_phone").value;
	var errorMessage = document.querySelector("#findIdForm #phone-error");
	
	if(phone === ""){
	  	document.querySelector("#findIdForm #findId_phone").classList.add("error");
	  	errorMessage.textContent = "전화번호가 입력되지 않았습니다.";
	  	errorMessage.style.display = "block";
	}else{
	  	document.querySelector("#findIdForm #findId_phone").classList.remove("error");
	  	errorMessage.style.display = "none";
	}
}


//비밀번호 찾기 ==================================================================
//아이디확인
document.querySelector("#findPasswordForm #findPassword_uid").addEventListener("blur", checkFindPasswordUid);

function checkFindPasswordUid() {
	var uid = document.querySelector("#findPasswordForm #findPassword_uid").value;
	var errorMessage = document.querySelector("#findPasswordForm #uid-error");
	
	if(uid === ""){
	  	document.querySelector("#findPasswordForm #findPassword_uid").classList.add("error");
	  	errorMessage.textContent = "아이디가 입력되지 않았습니다.";
	  	errorMessage.style.display = "block";
	}else{
	  	document.querySelector("#findPasswordForm #findPassword_uid").classList.remove("error");
	  	errorMessage.style.display = "none";
	}
}

//이름 확인
document.querySelector("#findPasswordForm #findPassword_uname").addEventListener("blur", checkFindPasswordName);

function checkFindPasswordName() {
	var name = document.querySelector("#findPasswordForm #findPassword_uname").value;
	var errorMessage = document.querySelector("#findPasswordForm #name-error");
	
	if(name === ""){
	  	document.querySelector("#findPasswordForm #findPassword_uname").classList.add("error");
	  	errorMessage.textContent = "이름이 입력되지 않았습니다.";
	  	errorMessage.style.display = "block";
	}else{
	  	document.querySelector("#findPasswordForm #findPassword_uname").classList.remove("error");
	  	errorMessage.style.display = "none";
	}
}  

//전화번호 확인
document.querySelector("#findPasswordForm #findPassword_phone").addEventListener("blur", checkFindPasswordPhone);

function checkFindPasswordPhone() {
	var phone = document.querySelector("#findPasswordForm #findPassword_phone").value;
	var errorMessage = document.querySelector("#findPasswordForm #phone-error");
	
	if(phone === ""){
	  	document.querySelector("#findPasswordForm #findPassword_phone").classList.add("error");
	  	errorMessage.textContent = "전화번호가 입력되지 않았습니다.";
	  	errorMessage.style.display = "block";
	}else{
	  	document.querySelector("#findPasswordForm #findPassword_phone").classList.remove("error");
	  	errorMessage.style.display = "none";
	}
}

//회원정보 수정 ==================================================================
//이름확인
document.getElementById("newName").addEventListener("blur", checkNewName);

function checkNewName() {
	var newName = document.getElementById("newName").value;
	var errorMessage = document.getElementById("newName-error");
	
	if(newName === ""){
	  	document.getElementById("newName").classList.add("error");
	  	errorMessage.textContent = "이름이 입력되지 않았습니다.";
	  	errorMessage.style.display = "block";
	}else{
	  	document.getElementById("newName").classList.remove("error");
	  	errorMessage.style.display = "none";
	}
}   

// 비밀번호 확인
document.getElementById("newPassword").addEventListener("blur", checkNewPassword);

function checkNewPassword() {
	var newPassword = document.getElementById("newPassword").value;
	var errorMessage = document.getElementById("newPassword-error");
	
	if(newPassword === ""){
	  	document.getElementById("newPassword").classList.add("error");
	  	errorMessage.textContent = "비밀번호가 입력되지 않았습니다.";
	  	errorMessage.style.display = "block";
	}else{
	  	document.getElementById("newPassword").classList.remove("error");
	  	errorMessage.style.display = "none";
	}
}

//비밀번호 같은지 확인
document.getElementById("newPasswordCheck").addEventListener("blur", checkNewPasswordCheck);

function checkNewPasswordCheck() {
	var newPassword = document.getElementById("newPassword").value;
	var newPasswordCheck = document.getElementById("newPasswordCheck").value;
	var errorMessage = document.getElementById("newPasswordCheck-error");
	
	if(newPassword !== newPasswordCheck) {
		document.getElementById("newPasswordCheck").classList.add("error");
		errorMessage.textContent = "비밀번호가 같지 않습니다.";
		errorMessage.style.display = "block";
	} else {
		document.getElementById("newPasswordCheck").classList.remove("error");
		errorMessage.style.display = "none";
	}
	
}

//전화번호 확인
document.getElementById("newPhone").addEventListener("blur", checkNewPhone);

function checkNewPhone() {
	var newPhone = document.getElementById("newPhone").value;
	var errorMessage = document.getElementById("newPhone-error");
	
	if(newPhone === ""){
	  	document.getElementById("newPhone").classList.add("error");
	  	errorMessage.textContent = "전화번호가 입력되지 않았습니다.";
	  	errorMessage.style.display = "block";
	}else{
	  	document.getElementById("newPhone").classList.remove("error");
	  	errorMessage.style.display = "none";
	}
}

//이메일 확인
document.getElementById("newEmail").addEventListener("blur", checkNewEmail);

function checkNewEmail() {
	var newEmail = document.getElementById("newEmail").value;
	var errorMessage = document.getElementById("newEmail-error");
	
	if(newEmail === ""){
	  	document.getElementById("newEmail").classList.add("error");
	  	errorMessage.textContent = "이메일이 입력되지 않았습니다.";
	  	errorMessage.style.display = "block";
	}else{
	  	document.getElementById("newEmail").classList.remove("error");
	  	errorMessage.style.display = "none";
	}
}


