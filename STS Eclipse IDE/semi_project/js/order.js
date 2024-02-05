 
  
  	let btn = Array.from(document.querySelectorAll(".status"));
    let menu = document.querySelector("#nav")

		console.log('btn:', btn);
		for(let i=0; i < btn.length; i++){
		
		  btn[i].addEventListener("dblclick",()=>{
	        btn[i].classList.add("active");
	        nav.classList.add("active");
	    });
	    
	    btn[i].addEventListener("click",()=>{
	        btn[i].classList.remove("active");
	        nav.classList.remove("active");
	    });
    }
    

	
	
 /*function alert(){
	 console.log('찍히나?');
 }
 
 function alert2(){
	 console.log('클릭?');
 }*/
 
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