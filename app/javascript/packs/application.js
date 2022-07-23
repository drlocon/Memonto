// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "jquery";
import "popper.js";
import "bootstrap";
import Chart from 'chart.js/auto';
import '@fortawesome/fontawesome-free/js/all'
import "../stylesheets/application"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

global.Chart = Chart;

document.addEventListener("turbolinks:load", function(){
  let radio_btns = document.querySelectorAll(`input[type='radio'][class='hidden_radio']`);
  for (let target of radio_btns) {
    target.addEventListener(`change`, () => {
      document.querySelector('.check_radio').classList.remove('check_radio');
      document.querySelector(`label[for='${target.id}']`).classList.add('check_radio');
    });
  }
})