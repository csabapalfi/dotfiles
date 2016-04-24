// ==UserScript==
// @name        .chrome - trello.com
// @include     http://trello.com/*
// @include     https://trello.com/*
// @version     1.0.0
// ==/UserScript==

document.addEventListener('DOMNodeInserted', () => {
  // show card counts
  const cardCounts = document.querySelectorAll('.list-header-num-cards');
  Array.from(cardCounts).forEach(cardCount => {
    cardCount.classList.remove('hide');
  });
  // hide add list
  const addList = document.querySelectorAll('.js-add-list')[0];
  addList.classList.add('hide');

}, false);
