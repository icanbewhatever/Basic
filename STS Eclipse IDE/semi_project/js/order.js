let btn1 = Array.from(document.querySelectorAll(".status"));
let menu = document.querySelector("#nav");
let prevClickedIndex = null; // 이전에 클릭한 .status 요소의 인덱스를 저장할 변수

// 메뉴 영역 외의 다른 요소 클릭 시 active 클래스 제거
document.addEventListener("click", (event) => {
    if (!event.target.closest(".content-box") && !event.target.closest("#nav")) { 
        // .content-box나 #nav 요소와 그 하위 요소를 제외한 다른 요소 클릭 시
        btn1.forEach((btn) => {
            btn.classList.remove("active");
        });
        menu.classList.remove("active");
    }
});

for (let i = 0; i < btn1.length; i++) {
    btn1[i].addEventListener("dblclick", () => {
        // 이전에 클릭한 .status에서 active 클래스 제거
        if (prevClickedIndex !== null) {
            btn1[prevClickedIndex].classList.remove("active");
        }
        prevClickedIndex = i; // 현재 클릭한 .status의 인덱스를 저장

        btn1[i].classList.add("active");
        menu.classList.add("active");

        // 해당 상태에 대한 의뢰자 정보 가져오기
        var statusText = btn1[i].innerText;
        var requesterValue = btn1[i].parentElement.querySelector(".requester").textContent.trim();
        var orderNum = btn1[i].parentElement.querySelector(".ordernum").innerText;
        //var orderNum = btn1[i].parentElement.querySelector("#ordernum").value;
        //var orderNum_popup = document.getElementById("ordernum");
				//console.log("주문 번호:", orderNum);        
        
        // 의뢰자 input 요소에 설정
        document.getElementById("requester").value = requesterValue;
        
         // 주문 번호 설정
        document.getElementById("ordernum").value = orderNum;
        
        // 상태 팝업 설정
        var status_popup = document.getElementById("status");
        var status_popup_idx = getStatusPopupIdx(statusText);
        status_popup.options[status_popup_idx].selected = true;
    });

    btn1[i].addEventListener("click", () => {
        btn1[i].classList.remove("active");
    });
}

function getStatusPopupIdx(textStatus) {
    if (textStatus == '진행중')
        return 0;
    if (textStatus == '완료')
        return 1;
    if (textStatus == '중지')
        return 2;
}


/*	
function alert(){
	console.log('찍히나?');
}
 
function alert2(){
  console.log('클릭?');
}
*/
   /* let btn = document.querySelector(".status");
    let menu = document.querySelector("#nav")

    btn.addEventListener("dblclick",()=>{
        btn.classList.add("active");
        nav.classList.add("active");
    });
    btn.addEventListener("click",()=>{
        btn.classList.remove("active");
        nav.classList.remove("active");
    });
*/
    
    
/*$('.status').on('click', function () {
    $('#nav').addClass('active');
    $('.overlay').fadeIn();
});

$('.content-box').on('click', function () {
    $('#nav').removeClass('active');
});*/


/*  	let btn = Array.from(document.querySelectorAll(".status"));
    let menu = document.querySelector("#nav")

	for(let i=0; i < btn.length; i++){
		
		  btn[i].addEventListener("dblclick",()=>{
        btn.classList.add("active");
        nav.classList.add("active");
    });
    
      btn[i].addEventListener("click",()=>{
        btn.classList.remove("active");
        nav.classList.remove("active");
    });
    
	}*/