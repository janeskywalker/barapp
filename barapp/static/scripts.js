
let drinkArray = []
let subTotal = 0

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




const drinkDisplay = document.querySelector('.drink-display')

const categoryView = document.addEventListener('click', (e)=>{
    if(e.target.tagName === "P") {
        console.log(`clicking ${e.target.textContent}`)
        console.log(e.target.className)
        drinkDisplay.innerHTML += `${e.target.textContent} $${e.target.className} <br>`

        drinkArray.push({"drinkName": e.target.textContent, "price":e.target.className})
    }

})



const saveDrinkBtn = document.querySelector('.save-drink')

const drink = document.querySelector('.drink')

saveDrinkBtn.addEventListener('click', (e)=>{
    console.log(drinkArray)

    const tabDisplay = document.querySelector('#tab-display')

    drinkArray.forEach(drink=>{
        subTotal += parseInt(drink.price)
        console.log(drink)
        tabDisplay.innerHTML += `<p>${drink.drinkName} $${drink.price}</p>`
    })

    drinkDisplay.innerHTML = ""
    drinkArray = []

    console.log(subTotal)
    const subTotalDisplay = document.querySelector('#sub-total')

    subTotalDisplay.innerHTML = `Subtotal: $${subTotal}`
})