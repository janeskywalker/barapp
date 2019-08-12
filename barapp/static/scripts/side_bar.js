const newOrderBtn = document.querySelector('#new-order-btn')
// const saveOrderBtn = document.querySelector('#save-order-btn')
const closeTabBtn = document.querySelector('#close-tab-btn')

const listOrderSection = document.querySelector('#list-order')
const currentOrderSection = document.querySelector('#current-order')
const newOrderSection = document.querySelector('#new-order')
const orderList = document.querySelector('#order-list')

function csrfcookie() {
    var cookieValue = null,
        name = 'csrftoken';
    if (document.cookie && document.cookie !== '') {
        var cookies = document.cookie.split(';');
        for (var i = 0; i < cookies.length; i++) {
            var cookie = cookies[i].trim();
            if (cookie.substring(0, name.length + 1) == (name + '=')) {
                cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                break;
            }
        }
    }
    return cookieValue;
};


newOrderBtn.addEventListener('click', (e)=>{
    listOrderSection.classList.remove('show')
    currentOrderSection.classList.remove('show')
    newOrderSection.classList.add('show')
})

// saveOrderBtn.addEventListener('click', (e)=>{
//     fetch('/saveorder', {
//         method: 'POST', 
//         headers: {
//             'X-CSRFToken': csrfcookie()
//         }
//     })
// })

