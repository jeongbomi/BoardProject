

//아이디 확인
document.getElementById("uid").addEventListener("blur", checkId);

function checkId() {
	var uid = document.getElementById("uid").value;
	var errorMessage = document.getElementById("uid-error");
	
	var uidRegex = /^[a-z0-9]{4,}$/;
	///^(?=.*[a-z])(?=.*\d).{4,}$/
	if (!uidRegex.test(uid)) {
	    document.getElementById("uid").classList.add("error");
	    errorMessage.textContent = "아이디는 소문자와 숫자를 포함한 4글자 이상이어야 합니다.";
	    errorMessage.style.display = "block";
    } else {
        document.getElementById("uid").classList.remove("error");
		errorMessage.style.display = "none";
    }
	
}

// 이름확인
document.getElementById("uname").addEventListener("blur", checkName);

function checkName() {
	var name = document.getElementById("uname").value;
	var errorMessage = document.getElementById("name-error");
	
	if(name === ""){
	  	document.getElementById("uname").classList.add("error");
	  	errorMessage.textContent = "이름이 입력되지 않았습니다.";
	  	errorMessage.style.display = "block";
	}else{
	  	document.getElementById("uname").classList.remove("error");
	  	errorMessage.style.display = "none";
	}
}   

// 비밀번호 확인
document.getElementById("password").addEventListener("blur", checkPassword);

function checkPassword() {
	var password = document.getElementById("password").value;
	var errorMessage = document.getElementById("password-error");
	
	if(password === ""){
	  	document.getElementById("password").classList.add("error");
	  	errorMessage.textContent = "비밀번호가 입력되지 않았습니다.";
	  	errorMessage.style.display = "block";
	}else{
	  	document.getElementById("password").classList.remove("error");
	  	errorMessage.style.display = "none";
	}
}

//비밀번호 같은지 확인
document.getElementById("passwordCheck").addEventListener("blur", checkPasswordCheck);

function checkPasswordCheck() {
	var password = document.getElementById("password").value;
	var passwordCheck = document.getElementById("passwordCheck").value;
	var errorMessage = document.getElementById("passwordCheck-error");
	
	if(password !== passwordCheck) {
		document.getElementById("passwordCheck").classList.add("error");
		errorMessage.textContent = "비밀번호가 일치하지 않습니다.";
		errorMessage.style.display = "block";
	} else {
		document.getElementById("passwordCheck").classList.remove("error");
		errorMessage.style.display = "none";
	}
	
}

// 전화번호 확인
document.getElementById("phone").addEventListener("blur", checkPhone);

function checkPhone() {
	var phone = document.getElementById("phone").value;
	var errorMessage = document.getElementById("phone-error");
	
	if(phone === ""){
	  	document.getElementById("phone").classList.add("error");
	  	errorMessage.textContent = "전화번호가 입력되지 않았습니다.";
	  	errorMessage.style.display = "block";
	}else{
	  	document.getElementById("phone").classList.remove("error");
	  	errorMessage.style.display = "none";
	}
}

// 이메일 확인
document.getElementById("email").addEventListener("blur", checkEmail);

function checkEmail() {
	var email = document.getElementById("email").value;
	var errorMessage = document.getElementById("email-error");
	
	if(email === ""){
	  	document.getElementById("email").classList.add("error");
	  	errorMessage.textContent = "이메일이 입력되지 않았습니다.";
	  	errorMessage.style.display = "block";
	}else{
	  	document.getElementById("email").classList.remove("error");
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










