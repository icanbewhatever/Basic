// 상태메시지 누를때 옆 창 나오는 쿼리  
let btn1 = Array.from(document.querySelectorAll(".status"));
let menu = document.querySelector("#nav")


//console.log('btn1:', btn1);
for(let i=0; i < btn1.length; i++){
  btn1[i].addEventListener("dblclick",()=>{
      btn1[i].classList.add("active");
      nav.classList.add("active");
      
  		//console.log('btn:', btn1[i].innerText);
  		var status_popup = document.getElementById("status");
  		var status_popup_idx = getStatusPopupIdx(btn1[i].innerText);
			
			status_popup.options[status_popup_idx].selected = true;
			
			// 모든 요소 선택
			var requesterElements = document.querySelectorAll(".requester");
			
			// 숨겨진 요소의 값을 배열로 저장할 변수 선언
			var requesterValues = [];
			
			// 각 요소에 대해 반복
			requesterElements.forEach(function(element) {
			    // 숨겨진 요소의 값을 가져와서 배열에 추가
			    var requesterValue = element.textContent.trim();
			    requesterValues.push(requesterValue);
			});
			
			// 배열에 저장된 값 출력 또는 다른 처리
			console.log("의뢰자 정보 배열:", requesterValues);
			
	});  		    
  
  btn1[i].addEventListener("click",()=>{
      btn1[i].classList.remove("active");
      nav.classList.remove("active");
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