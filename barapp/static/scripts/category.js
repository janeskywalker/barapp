

const drinkButton = document.querySelector('.drink-button')
const drinkList = document.querySelector('#drink-list')

const ingredientButton = document.querySelector('.ingredient-button')
const ingredientList = document.querySelector('#ingredient-list')

// hide and show drink/ingredients list 
drinkButton.addEventListener('click', (e)=>{
    drinkList.classList.remove('hide')
    ingredientList.classList.add('hide')
})

// hide and show drink/ingredients list 
ingredientButton.addEventListener('click', (e)=>{
    ingredientList.classList.remove('hide')
    drinkList.classList.add('hide')
})

// on click of drink and ingredient btn, item get to be added to db
drinkList.addEventListener('click', (e)=>{
    const target = e.target
    console.log('target: ', target)
    if (target.dataset['id']) {
        console.log(target.dataset['id'])

        fetch('/addDrinkToOrder', {
            method: 'POST', 
            headers: {
                'Content-Type': 'application/json',
                'X-CSRFToken': csrfcookie()
            },
            body: JSON.stringify({
                drink_id: target.dataset['id']
            })
        }).then((response) => {
            console.log('response: ', response)
            // Render drink to sidebar
        })
    }
})

ingredientList.addEventListener('click', (e)=>{
    const target = e.target
    console.log('target: ', target)
    if (target.dataset['id']) {
        console.log(target.dataset['id'])

        fetch('/addIngredientToOrder', {
            method: 'POST', 
            headers: {
                'Content-Type': 'application/json',
                'X-CSRFToken': csrfcookie()
            },
            body: JSON.stringify({
                ingredient_id: target.dataset['id']
            })
        }).then(async (response) => {
            console.log('response: ', response)
            console.log(await response.json())
            // Render drink to sidebar
        })
    }
})



// const categoryPanel = document.querySelector('#category-panel')


// categoryPanel.addEventListener('click', (e) => {
//     if (e.target.parentNode.tagName === 'DIV') {   
//         console.log(e.target)
//     }  
// })







// const wrapper = document.querySelector('#wrapper')

// categoryPanel.addEventListener('click', (e) => {
//     if (e.target.parentNode.tagName === 'DIV') {   
        // pick out category
        // categoryClicked = e.target.textContent
        // show modal
        // var modal = document.querySelector(`.${categoryClicked}`);
        // modal.classList.toggle("hidden");
    
//     }  
// })






// let drinkArray = []
// let tabArray = []

// let subTotal = 0



// const drinkDisplay = document.querySelector('.drink-display')

// const categoryView = document.addEventListener('click', (e)=>{
//     if(e.target.tagName === "P") {
//         console.log(`clicking ${e.target.textContent}`)
//         console.log(e.target.className)
//         drinkDisplay.innerHTML += `${e.target.textContent} $${e.target.className} <br>`

//         drinkArray.push({"drinkName": e.target.textContent, "price":e.target.className})
//     }

// })



// const saveDrinkBtn = document.querySelector('.save-drink')

// const drink = document.querySelector('.drink')

// saveDrinkBtn.addEventListener('click', (e)=>{
//     console.log(drinkArray)

//     const tabDisplay = document.querySelector('#tab-display')

//     drinkArray.forEach(drink=>{
//         subTotal += parseInt(drink.price)
//         console.log(drink)
//         tabDisplay.innerHTML += `<p>${drink.drinkName} $${drink.price}</p>`
//     })

//     drinkDisplay.innerHTML = ""

//     tabArray = tabArray.concat(drinkArray)
//     console.log({tabArray})

//     drinkArray = []

//     console.log(subTotal)
//     const subTotalDisplay = document.querySelector('#sub-total')

//     subTotalDisplay.innerHTML = `Subtotal: $${subTotal}`

// })

// const closeTabBtn = document.querySelector('.close-tab')

// closeTabBtn.addEventListener('click', (e)=>{
//     console.log(tabArray)

//     const newTab = {
//         "close_date_time": `${new Date().toLocaleString}`, 
//         "user": `${e.target.classList[1]}`
//     }

