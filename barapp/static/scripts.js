

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

    // const addNewCity = (event) => {
    //     event.preventDefault();
    //     const name = document.getElementById('name');
    //     const description = document.getElementById('description');
    //     const newCity = ({name: name.value, description: description.value});
//         fetch("http://localhost:8000/savetab", {
//           method: 'POST',
//           headers: { 'Content-Type': 'application/json' },
//           body: JSON.stringify(newTab)
//         })
//           .then((res) => res.json())
//           .then((data) => {
//             console.log(data)
//           })
//           .catch((err) => console.log(err));
// })

