$(document).on('turbolinks:load', function(){
  $('ul.item-menue li').hover(function(){
  $('ul.dropdown_category:not(:animated)', this).slideDown("fast");
 }, function(){
    $('ul.dropdown_category', this).slideUp('fast');
});
});

$(document).on('turbolinks:load', function(){
  $('ul.dropdown_category li').hover(function(){
  $('ul.dropdown_midcategory:not(:animated)', this).slideDown("fast");
 }, function(){
    $('ul.dropdown_midcategory', this).slideUp('fast');
});
});
