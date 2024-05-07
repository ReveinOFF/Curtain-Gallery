updateCartData = (newData) => {
  const existingData = this.getCartData();
  const updatedData = [...existingData, newData];
  localStorage.setItem("cart", JSON.stringify(updatedData));

  let cart_ex = document.getElementById("cart-btn");
  if (!cart_ex.classList.contains("exist")) cart_ex.classList.add("exist");
};

removeCartItem = (itemId) => {
  const existingData = this.getCartData();
  const updatedData = existingData.filter((item) => item.id !== itemId);
  localStorage.setItem("cart", JSON.stringify(updatedData));

  if (updatedData.length === 0) {
    let cart_ex = document.getElementById("cart-btn");
    cart_ex.classList.remove("exist");
  }
};

isCartEmpty = () => {
  const cartData = this.getCartData();
  return cartData.length === 0;
};

getCartData = () => {
  const cartData = localStorage.getItem("cart");
  return cartData ? JSON.parse(cartData) : [];
};

if (!isCartEmpty()) document.getElementById("cart-btn").classList.add("exist");
