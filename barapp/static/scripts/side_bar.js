const newOrderBtn = document.querySelector('#new-order-btn')
const listOrderSection = document.querySelector('#list-order')


newOrderBtn.addEventListener('click', (e)=>{
    console.log(newOrderBtn)
    listOrderSection.classList.add('hide')
})