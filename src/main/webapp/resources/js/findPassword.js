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

//이름확인
document.getElementById("name").addEventListener("blur", checkName);

function checkName() {
	var name = document.getElementById("name").value;
	var errorMessage = document.getElementById("name-error");
	
	if(name === ""){
	  	document.getElementById("name").classList.add("error");
	  	errorMessage.textContent = "이름이 입력되지 않았습니다.";
	  	errorMessage.style.display = "block";
	}else{
	  	document.getElementById("name").classList.remove("error");
	  	errorMessage.style.display = "none";
	}
}   

//전화번호 확인
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