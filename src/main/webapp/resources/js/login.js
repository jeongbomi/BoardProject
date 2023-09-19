//아이디 확인
document.getElementById("uid").addEventListener("blur", checkUid);

function checkUid() {
	var uid = document.getElementById("uid").value;
	var errorMessage = document.getElementById("uid-error");
	
	if(uid === ""){
	  	document.getElementById("uid").classList.add("error");
	  	errorMessage.textContent = "아이디가 입력되지 않았습니다.";
	  	errorMessage.style.display = "block";
	}else{
	  	document.getElementById("uid").classList.remove("error");
	  	errorMessage.style.display = "none";
	}
}

//비밀번호 확인
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