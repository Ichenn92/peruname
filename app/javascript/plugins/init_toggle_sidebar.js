const sideBar_dom = document.getElementById("sidebar");
const filterBtn_dom = document.getElementById("button-filter");
const symbolBtn_dom = document.getElementById("symbol-filter");

const initToggleSidebar = () => {
  filterBtn_dom.addEventListener("click", () => {
    sideBar_dom.classList.toggle("translated-down");
    symbolBtn_dom.classList.toggle("fa-times");
    symbolBtn_dom.classList.toggle("fa-sliders-h");
  });
};

export { initToggleSidebar };