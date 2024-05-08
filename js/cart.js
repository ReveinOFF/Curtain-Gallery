//Add item to cart
updateCartData = (newData) => {
  const existingData = getCartData();
  const updatedData = [...existingData, newData];
  localStorage.setItem("cart", JSON.stringify(updatedData));

  let cart_ex = document.getElementById("cart-btn");
  if (!cart_ex.classList.contains("exist")) cart_ex.classList.add("exist");
};

//Remove item to cart
removeCartItem = (itemId) => {
  const existingData = getCartData();
  const updatedData = existingData.filter((item) => item.id !== itemId);
  localStorage.setItem("cart", JSON.stringify(updatedData));

  if (updatedData.length === 0) {
    let cart_ex = document.getElementById("cart-btn");
    cart_ex.classList.remove("exist");
  }
};

//Checking for availability in the cart
isCartEmpty = () => {
  const cartData = getCartData();
  return cartData.length === 0;
};

//Get all items from cart
getCartData = () => {
  const cartData = localStorage.getItem("cart");
  return cartData ? JSON.parse(cartData) : [];
};

//If cart is not empty then show it in the header
if (!isCartEmpty()) document.getElementById("cart-btn").classList.add("exist");
