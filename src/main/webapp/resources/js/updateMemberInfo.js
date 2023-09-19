// 회원정보 수정 팝업창 보여주고 숨기기 기능
function showEditPopup() {
  var overlay = document.getElementById('editPopupOverlay');
  var popup = document.getElementById('editPopupContent');
  overlay.style.display = 'block';
  popup.style.display = 'block';
}

function hideEditPopup() {
  var overlay = document.getElementById('editPopupOverlay');
  var popup = document.getElementById('editPopupContent');
  overlay.style.display = 'none';
  popup.style.display = 'none';
}


//"updateInfoButton" 버튼 클릭시 팝업창 생성
var updateButton = document.getElementById('updateMemberInfoButton');
  updateButton.addEventListener('click', showEditPopup);
  
  
//-------------------------------------------------------------------
//유효성검사
//이름확인
document.getElementById("newName").addEventListener("blur", checkNewName);

function checkNewName() {
	var newName = document.getElementById("newName").value;
	var errorMessage = document.getElementById("newName-error");
	
	if(newName === ""){
	  	document.getElementById("newName").classList.add("error");
	  	errorMessage.textContent = "기존 정보 그대로 저장됩니다.";
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
	  	errorMessage.textContent = "기존 정보 그대로 저장됩니다.";
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
	  	errorMessage.textContent = "기존 정보 그대로 저장됩니다.";
	  	errorMessage.style.display = "block";
	}else{
	  	document.getElementById("newPhone").classList.remove("error");
	  	errorMessage.style.display = "none";
	}
}