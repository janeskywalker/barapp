const newOrderBtn = document.querySelector('#new-order-btn')
const listOrderSection = document.querySelector('#list-order')

const newOrderSection = document.querySelector('#new-order')


newOrderBtn.addEventListener('click', (e)=>{
    newOrderSection.classList.remove('hide')
    listOrderSection.classList.add('hide')
})