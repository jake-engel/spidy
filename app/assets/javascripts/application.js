//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .
//= require cocoon

// -

$('.search').click(function(){
  $('.search, .search-bar').toggleClass('active');
  $('input').focus();
});
