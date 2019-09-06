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
//= require jquery3
//= require popper
//= require bootstrap
//= require activestorage
//= require turbolinks
//= require_tree .

//window.setTimeout(function() {
//    $(".alert").fadeTo(500, 0).slideUp(500, function(){
//        $(this).remove();
//    });
//}, 2000);

window.onscroll = function() {scrollFunction()};

function scrollFunction() {
  if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
    document.getElementById("main-nav-bar").style.padding = "1em";
    document.getElementById("main-nav-bar").style.background = "#00A382";
  } else {
    document.getElementById("main-nav-bar").style.padding = "1.5em 2.5em 1.5em 2.5em";
    document.getElementById("main-nav-bar").style.background = "#00B894";
  }
}
