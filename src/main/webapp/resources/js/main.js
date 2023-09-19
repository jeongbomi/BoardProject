//슬라이드쇼==================================================
var slides = document.querySelectorAll("#slides > img");
var prev = document.getElementById("prev");
var next = document.getElementById("next");
var current = 0;

showSlides(current);
prev.onclick = prevSlide;
next.onclick = nextSlide;

// 1초마다 자동으로 넘어가도록 설정
setInterval(function() {
  nextSlide();
}, 2600);

function showSlides(n) {
  for (let i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";
  }
  slides[n].style.display = "block";
}

function prevSlide() {
  if (current > 0) current -= 1;
  else
    current = slides.length - 1;
    showSlides(current);
}

function nextSlide() {
  if (current < slides.length - 1) current += 1;
  else
    current = 0;
    showSlides(current);  
}
//===========================================================

//더보기 탭=====================================================
function redirectToTab() {
    var tab1 = document.getElementById("tab1");
    var tab2 = document.getElementById("tab2");

    if (tab1.checked) {
      location.href = "/project4/notice/noticeList.do";
    } else if (tab2.checked) {
      location.href = "/project4/board/boardList.do";
    }
}
//===========================================================
