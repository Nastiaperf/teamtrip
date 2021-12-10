// ######################
// (1) Function selecting links into calendar to set the category for next/previous day when you land on the Show page.
const setActiveTabOnLoading = () => {
  const target = document.querySelectorAll("a.active")
  target.forEach(element => {
    changeQuerySearchParamsByActive(element.innerHTML)
  })
};

// (2) Function changing the calendar link and current url when selecting a category
const setActiveTabOnClicking = () => {
  const target = document.querySelectorAll(".js-selector")
  target.forEach(element => {
    element.addEventListener('click', function () {
      changeQuerySearchForReload(element.innerHTML)
      changeQuerySearchParamsOnClick(element.innerHTML)
    });
  })
};
// ######################
// Callback functions (1)
const changeQuerySearchParamsByActive = (category) => {
  const target = document.querySelectorAll(".js-selector-days")
  target.forEach(element => {
    const usp = new URLSearchParams(element.search)
    usp.set("category", category)
    element.search = usp
  });
}
// Callback functions (2)
const changeQuerySearchForReload = (category) => {
  const refresh = window.location.protocol + "//" + window.location.host + window.location.pathname + `?category=${category}`;
  window.history.pushState({ path: refresh }, '', refresh);
  const a = document.query
}

const changeQuerySearchParamsOnClick = (category) => {
  const target = document.querySelectorAll(".js-selector-days")
  target.forEach(element => {
    const usp = new URLSearchParams(element.search)
    usp.set("category", category)
    element.search = usp
    });
}
// ######################

export { setActiveTabOnLoading }
export { setActiveTabOnClicking }
