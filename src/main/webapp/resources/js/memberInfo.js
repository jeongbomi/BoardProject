// 회원정보 상세보기 팝업창 보여주고 숨기기 기능
function showInfoPopup() {
	var overlay = document.getElementById('infoPopupOverlay');
    var popup = document.getElementById('infoPopupContent');
    overlay.style.display = 'block';
    popup.style.display = 'block';
}

function hideInfoPopup() {
  var overlay = document.getElementById('infoPopupOverlay');
  var popup = document.getElementById('infoPopupContent');
  overlay.style.display = 'none';
  popup.style.display = 'none';
}

// "회원정보 상세보기" 버튼 클릭시 팝업창 생성
var infoButton = document.getElementById('memberInfoButton');
infoButton.addEventListener('click', showInfoPopup);


  