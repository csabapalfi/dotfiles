// ==UserScript==
// @name        .chrome - linkedin.com
// @include     https://www.linkedin.com/*
// @version     1.0.0
// ==/UserScript==

const hide = (id) => {
  const node = document.getElementById(id);
  if (node) {
    node.style.display = 'none';
  }
}


document.addEventListener(
  'DOMNodeInserted',
  () => [
    'ozfeed-container',
    'ad-container',
    'topTextAd',
    'text-ad-container',
  ].forEach(id => hide(id)),
  false
);
