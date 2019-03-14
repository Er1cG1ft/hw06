// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import scss from "../css/app.scss"

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import dependencies
//
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative paths, for example:
// import socket from "./socket"

import jQuery from 'jquery';
window.jQuery = window.$ = jQuery; // Bootstrap requires a global "$" object.
import "bootstrap";

$(function () {
  $('#start-work-button').click((ev) => {
    let user_id = $(ev.target).data('user-id');
    let task_id = $(ev.target).data('task-id');

    let text = JSON.stringify({
      time_block: {
        user_id: user_id,
        task_id: task_id
      },
    });

    $.ajax("/ajax/time_blocks", {
      method: "post",
      dataType: "json",
      contentType: "application/json; charset=UTF-8",
      data: text,
      success: (resp) => {
        location.reload();
      },
    });
  });
});

$(function () {
  $('#end-work-button').click((ev) => {
    let block_id = $(ev.target).data('block-id');

    let text = JSON.stringify({
      time_block: {
      },
    });

    $.ajax("/ajax/time_blocks/" + block_id, {
      method: "put",
      dataType: "json",
      contentType: "application/json; charset=UTF-8",
      data: text,
      success: (resp) => {
        location.reload();
      },
    });
  });
});