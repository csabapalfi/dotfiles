// ==UserScript==
// @name        Trello Card Counter
// @description Shows number of cards in a list next to list title
// @include     http://trello.com/*
// @include     https://trello.com/*
// @version     1.0.0
// ==/UserScript==

window.addEventListener('load', () => {
  Array.from(document.querySelectorAll('.list')).forEach(list => {
    const count = list.querySelectorAll('.list-card').length;
    const title = list.querySelectorAll('.list-header-name')[0];
    title.textContent = `${title.textContent} (${count})`;
  });
}, false);
