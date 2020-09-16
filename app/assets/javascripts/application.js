// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require_tree .

function initApp() {
  // Submit on Cmd + Enter
  document.body.addEventListener('keydown', function(e) {
    if(!(e.keyCode == 13 && e.metaKey)) return;

    var target = e.target;
    if(target.form) {
      target.form.submit();
    }
  });

  // Show how many characters left for large comments
  document.getElementById('comment_content').onkeyup = function () {
    var left = 3000 - this.value.length;

    if(left < 2000) {
      document.getElementById('count').innerHTML = "Characters left: " + left;
    }
  };
}

window.onload = initApp;
