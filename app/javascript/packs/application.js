// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")



// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import "controllers"

import { mapImport } from '../components/map.js'
import { calcRoute } from '../components/map.js'
import { setActiveTabOnLoading } from '../components/tab_menu.js'
import { setActiveTabOnClicking } from '../components/tab_menu.js'
import { initSweetalert } from '../plugins/init_sweetalert';
import { initSortable } from '../components/init_sortable.js'
// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  mapImport();
  calcRoute();
  setActiveTabOnLoading();
  setActiveTabOnClicking();
  initSweetalert('#sweet-alert', {
    title: "Invitation sent!",
    text: "Email has been sent, new member will join the trip when accepting the invitation",
    icon: "success"
  }, (value) => {
    console.log(value);
  });
  initSortable();
});
