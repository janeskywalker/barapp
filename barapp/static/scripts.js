const categoryPenel = document.querySelector('#category-penel')

categoryPenel.addEventListener('click', (e)=>{
    if (e.target.parentNode.tagName === 'DIV') {
        console.log(e.target.textContent)    

        // pick out category
        categoryClicked = e.target.textContent

        // show modal
        
    }  
})