// Reload with the current tab
const reloadMenu = () => {
  const target = document.querySelectorAll(".js-selector")
  target.forEach(element => {
    element.addEventListener('click', function () {
      changeQueryParams(element.innerHTML)
    });
  })
};

const changeQueryParams = (category) => {
  const refresh = window.location.protocol + "//" + window.location.host + window.location.pathname + `?category=${category}`;
  window.history.pushState({ path: refresh }, '', refresh);
}


export { reloadMenu }
