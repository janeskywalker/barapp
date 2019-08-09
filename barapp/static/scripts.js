const categoryPanel = document.querySelector('#category-panel')
const wrapper = document.querySelector('#wrapper')

categoryPanel.addEventListener('click', (e)=>{
    if (e.target.parentNode.tagName === 'DIV') {   
        // pick out category
        categoryClicked = e.target.textContent
        // show modal
        var modal = document.querySelector(`.${categoryClicked}`);
        modal.classList.toggle("hidden");
    }  
})

// wrapper.addEventListener('click', (e)=>{
//     // if (e.target.parentNode.tagName === 'DIV') {
//     //     console.log(e.target)    
//     //     // pick out category
//     //     categoryClicked = e.target.textContent

//         // show modal
//         var modal = document.getElementById("wrapper");
//         modal.classList.toggle("hidden");
//         console.log(modal)
//         // modal.style.display = 'block';
//     // }  
// })