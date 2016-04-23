// ==UserScript==
// @name        Hide facebook right column
// @include     https://www.facebook.com/*
// @version     1.0.0
// ==/UserScript==

const hideRightCol = () =>
  document.getElementById('rightCol').style.display = 'none',

window.addEventListener('load', hideRightCol ,false);

document.addEventListener('DOMNodeInserted', hideRightCol, false);
