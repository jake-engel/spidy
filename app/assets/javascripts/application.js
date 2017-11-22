//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require underscore
//= require gmaps/google
//= require_tree .

// -

$('.search').click(function(){
  $('.search, .search-bar').toggleClass('active');
  $('input').focus();
});
