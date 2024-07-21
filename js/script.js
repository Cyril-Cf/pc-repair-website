document.addEventListener("DOMContentLoaded", async function () {
  AOS.init({
    duration: 1500,
  });
  document.querySelector(".burger-menu").addEventListener("click", () => {
    document.querySelector("header nav ul").classList.toggle("active");
  });
});
