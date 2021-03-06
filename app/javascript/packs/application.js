// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";

// Internal imports, e.g:
import { initMapbox } from '../plugins/init_mapbox';
import { initAutocomplete } from '../plugins/init_autocomplete';
import { initFlatpickr } from '../plugins/init_flatpickr';
import { initToggleSidebar } from '../plugins/init_toggle_sidebar';
import { initBecomeAnActor } from '../plugins/init_become_an_actor';
import { initUpdatePriceForm } from '../plugins/init_update_price_form';
import { initCheckFilterForm } from '../plugins/init_check_filter_form';

// Events
document.addEventListener('turbolinks:load', () => {
  initMapbox();
  initAutocomplete();
  initFlatpickr();
  initToggleSidebar();
  initBecomeAnActor();
  initUpdatePriceForm();
  initCheckFilterForm();
});
