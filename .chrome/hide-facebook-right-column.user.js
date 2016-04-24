// ==UserScript==
// @name        Hide stuff in facebook right column
// @include     https://www.facebook.com/*
// @version     1.0.0
// ==/UserScript==

const hidden = [
  'pagelet_trending_tags_and_topics',
  'pagelet_ego_pane'
]

const hide = () => {
  hidden.forEach(id =>
    document.getElementById(id).style.display = 'none'
  )
  document.querySelectorAll('.home_right_column')[0].style.minHeight = 0
}

window.addEventListener('load', hide ,false);

document.addEventListener('DOMNodeInserted', hide, false);
