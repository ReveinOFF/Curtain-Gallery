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

function disScroll() {
  document.body.style.overflow = "hidden";
}
function allScroll() {
  document.body.style.overflow = "unset";
}

function eventCatalogClose(e) {
  if (!e.target.closest(".burger_th")) closeCatalog();
}
function closeCatalog() {
  let block = document.querySelectorAll(".burger_th.active")[0];
  block.classList.remove("active");

  let arrow = document.querySelectorAll(".arrow_ss.active")[0];
  arrow.classList.remove("active");

  document.removeEventListener("click", eventCatalogClose);
}
function showCatalog(num) {
  let block = document.getElementById(`catalog_s${num}`);
  let arrow = document.getElementById(`arrow_s${num}`);

  if (block.classList.contains("active")) {
    closeCatalog();
  } else {
    block.classList.add("active");
    arrow.classList.add("active");

    setTimeout(
      () => document.addEventListener("click", eventCatalogClose),
      500
    );
  }
}

function showMobCatalog(num) {
  let nav = document.getElementsByClassName("hm_nav")[num - 1];
  if (nav.classList.contains("active")) nav.classList.remove("active");
  else nav.classList.add("active");
}
