const initToggleSidebar = () => {
  const sideBar_dom = document.getElementById("sidebar");
  const filterBtn_dom = document.getElementById("button-filter");
  const closeBtn_dom = document.getElementById("button-close");
  const symbolBtn_dom = document.getElementById("symbol-filter");

  const toggleSideBar = () => {
    sideBar_dom.classList.toggle("translated-down");
    filterBtn_dom.classList.toggle("d-none");
  };

  if (sideBar_dom && symbolBtn_dom) {
    filterBtn_dom.addEventListener("click", () => {
      toggleSideBar();
    });
    closeBtn_dom.addEventListener("click", () => {
      toggleSideBar();
    });
  }
};

export { initToggleSidebar };