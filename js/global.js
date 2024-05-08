// START Show/hidde burger (Mobile)
function eventBurgerClose(e) {
  if (!e.target.closest(".mob_burg")) closeBurger();
}
function showBurger() {
  document.getElementsByClassName("mob_burg")[0].classList.add("active");

  setTimeout(() => document.addEventListener("click", eventBurgerClose), 500);
}
function closeBurger() {
  document.getElementsByClassName("mob_burg")[0].classList.remove("active");

  document.removeEventListener("click", eventBurgerClose);
}
// END Show/hidde burger (Mobile)

// Enable/Disable page scrolling
function disScroll() {
  document.body.style.overflow = "hidden";
}
function allScroll() {
  document.body.style.overflow = "unset";
}

// Show/hidde catalog from burger (Mobile)
function showMobCatalog(num) {
  let nav = document.getElementsByClassName("hm_nav")[num - 1];
  if (nav.classList.contains("active")) nav.classList.remove("active");
  else nav.classList.add("active");
}
