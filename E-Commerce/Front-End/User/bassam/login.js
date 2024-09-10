

async function login(event) {
    ;
    event.preventDefault();
    var url = 'https://localhost:7000/api/Users_Bassam/login';
    var form = document.getElementById("form1");
    var formData = new FormData(form);

    try {
        var response = await fetch(url, {
            method: "POST",
            body: formData,
        });

        if (response.ok) {
            var result = await response.json();
            localStorage.setItem('jwtToken', result.token);
            localStorage.setItem('userID', result.userID);
            clearCartFromLocalStorage(result.userID);
            window.history.back();
        } else {
            const errorData = await response.json();
            alert('Error: ' + (errorData.message || 'Email or password is incorrect'));
        }
    } catch (error) {
        console.error('Error:', error);
        alert('An error occurred while logging in. Please try again.');
    }
}

async function clearCartFromLocalStorage(userID){
    ;
    var cartItems = JSON.parse(localStorage.getItem('cart')) || [];
    
    cartItems.forEach(async element => {
        var requist = await fetch('https://localhost:7000/api/Cart/CreateNewCartItem', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({
                productId: element.productId,
                userId: userID,
                quantity: element.quantity
    
            })
        });
        
    });

    localStorage.removeItem('cart');

 
}