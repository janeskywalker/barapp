const newOrderBtn = document.querySelector('#new-order-btn')

const listOrderSection = document.querySelector('#list-order')
const currentOrderSection = document.querySelector('#current-order')
const newOrderSection = document.querySelector('#new-order')

newOrderBtn.addEventListener('click', (e)=>{
    listOrderSection.classList.remove('show')
    currentOrderSection.classList.remove('show')
    newOrderSection.classList.add('show')
})