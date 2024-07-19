import * as Turbo from "@hotwired/turbo";
// import "@src/controllers";
import "simplebar";
import "chartkick/chart.js";
import $ from "jquery";
import axios from "axios";

import * as coreui from "@coreui/coreui";
import {
  Toast,
  Popover,
  Tab,
  Modal,
  Dropdown,
  Sidebar,
  Navigation,
} from "@coreui/coreui";

import '../controllers/index'
import '../channels/notification_channel.js'

Turbo.start();

window.$ = $;
window.coreui = coreui;


// Array.from(document.querySelectorAll(".toast")).forEach(
//   (toastNode) => new Toast(toastNode),
// );

// // https://coreui.io/docs/components/popovers/
// var popoverTriggerList = [].slice.call(
//   document.querySelectorAll('[data-coreui-toggle="popover"]'),
// );
// var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
//   return new Popover(popoverTriggerEl);
// });

// var dropdownElementList = [].slice.call(
//   document.querySelectorAll(".dropdown-toggle"),
// );
// var dropdownList = dropdownElementList.map(function (dropdownToggleEl) {
//   return new Dropdown(dropdownToggleEl);
// });
// Array.from(document.querySelectorAll('[data-coreui="navigation"]')).forEach(
//   (element) => {
//     Navigation.navigationInterface(element);
//   },
// );

// document.addEventListener("turbo:load", () => {
//   console.log("load");

//   Array.from(document.querySelectorAll(".toast")).forEach(
//     (toastNode) => new Toast(toastNode),
//   );

//   // https://coreui.io/docs/components/popovers/
//   var popoverTriggerList = [].slice.call(
//     document.querySelectorAll('[data-coreui-toggle="popover"]'),
//   );
//   var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
//     return new Popover(popoverTriggerEl);
//   });

//   var dropdownElementList = [].slice.call(
//     document.querySelectorAll(".nav-group-toggle"),
//   );
//   var dropdownList = dropdownElementList.map(function (dropdownToggleEl) {
//     return new Dropdown(dropdownToggleEl);
//   });

//   // sidebar
//   // https://github.com/coreui/coreui/blob/3b8f5fda497ec6c679ad851832f2ec54e704b583/js/src/navigation.js?_pjax=%23js-repo-pjax-container%2C%20div%5Bitemtype%3D%22http%3A%2F%2Fschema.org%2FSoftwareSourceCode%22%5D%20main%2C%20%5Bdata-pjax-container%5D
//   Array.from(document.querySelectorAll('[data-coreui="navigation"]')).forEach(
//     (element) => {
//       Navigation.navigationInterface(element);
//     },
//   )
// });

// document.addEventListener("turbo:load", () => {
//   Array.from(document.querySelectorAll(".form-select")).forEach((element) => {   
//   });
// });
