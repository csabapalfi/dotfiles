// ==UserScript==
// @name        Trello Card Counter
// @description Shows number of cards in a list next to list title
// @include     http://trello.com/*
// @include     https://trello.com/*
// @version     1.0.0
// ==/UserScript==

// TODO use mutation observers instead of deprecated mutation events
document.addEventListener('DOMNodeInserted', () => {
  const cardCounts = document.querySelectorAll('.list-header-num-cards');
  Array.from(cardCounts).forEach(cardCount => {
    cardCount.classList.remove('hide');
  });
}, false);
