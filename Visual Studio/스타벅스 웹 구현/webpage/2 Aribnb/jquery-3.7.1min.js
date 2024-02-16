//'use strict' js문법강화

document.querySelectorAll('.category-button').forEach(button => {
  button.addEventListener("click", event => {
    document.querySelector('#active-category-button').removeAttribute('id');
    button.setAttribute('id', 'active-category-button');
    // console.log("클릭 발생");
  })
})