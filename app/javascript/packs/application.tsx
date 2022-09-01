// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import { BrowserRouter } from "react-router-dom";
import * as ActiveStorage from "@rails/activestorage";
import "channels";

Rails.start();
Turbolinks.start();
ActiveStorage.start();
// Support component names relative to this directory:
var componentRequireContext = require.context("components", true);
var ReactRailsUJS = require("react_ujs");
ReactRailsUJS.useContext(componentRequireContext);

import Router from "components/router/Router";
import React from "react";
import { createRoot } from "react-dom/client";
// import { ChakraProvider } from '@chakra-ui/react'
// import theme from 'components/theme/theme'

document.addEventListener("DOMContentLoaded", () => {
  const container = document.getElementById("app");
  const root = createRoot(container);
  root.render(
    // <ChakraProvider>
    <Router />
    // </ChakraProvider>
  );
});
