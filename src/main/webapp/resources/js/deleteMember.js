// 회원탈퇴 팝업창 보여주고 숨기기 기능
function showPopup() {
  var overlay = document.getElementById('popupOverlay');
  var popup = document.getElementById('popupContent');
  overlay.style.display = 'block';
  popup.style.display = 'block';
}

function hidePopup() {
  var overlay = document.getElementById('popupOverlay');
  var popup = document.getElementById('popupContent');
  overlay.style.display = 'none';
  popup.style.display = 'none';
}

// 회원탈퇴 Yes, No
//function deleteConfirm(confirm) {
  //if (confirm) {
    // User clicked 'Yes'
    // jsp 연결
  //  window.location.href = "delete.do";
 // } else {
    // User clicked 'No' or closed the popup
    // Do nothing or perform any other desired action
//  }
  
  // 팝업창 숨기기
//  hidePopup();
//}


// "deleteMemberButton" 버튼 클릭시 팝업창 생성
var deleteButton = document.getElementById('deleteButton');
deleteButton.addEventListener('click', showPopup);
