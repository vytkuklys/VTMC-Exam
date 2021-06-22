const btn = document.querySelector('.btn');

const isEmpty = val =>{
    return !val && val !== 0;
}

const removeAlert = () =>{
    const alert = document.querySelector('.alert-box');

    alert.parentElement.removeChild(alert);
}

const addBtnEvent = btn =>{
    btn.addEventListener('click', removeAlert);
}

const renderAlert = () =>{
    const alert = document.createElement('div');
    const text = document.createElement('p');
    const btn = document.createElement('button');
    const body = document.body;

    text.textContent = "Būtina užpildyti visus laukus!";
    btn.textContent = "Gerai";
    alert.classList.add('alert-box');
    alert.append(text, btn);
    body.appendChild(alert);

    addBtnEvent(btn);
}

function validateForm(){
    const name = document.getElementById('vardas').value;
    const email = document.getElementById('el-pastas').value;

    if(isEmpty(name) || isEmpty(email)){
        renderAlert();
        setTimeout(removeAlert, 6000);
    }
}

btn.addEventListener('click', (e)=>{
    e.preventDefault();
    validateForm();
})