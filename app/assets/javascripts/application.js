// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap.min.js
//= require easing_min.js
//= require classie.js
//= require jqBootstrapValidation.js
//= require jquery-jvectormap-2.0.1.min
// require contact_me.js

/*Get children of a category for select*/
function getCategoryChildrenForSelect(category_id) {
  return $.ajax({
    type: "GET",
    async:false,
    dataType: "json",
    url: "/categories/"+category_id+"/get_children_for_select.json",
    dataType: "JSON",
  }).responseJSON;
}

$(function() {
$("#artwork_category_1_id").change(function() {
    // make a POST call and replace the content
    select = document.getElementById('artwork_category_2_id');
    select.options.length = 0;
    data = getCategoryChildrenForSelect($("#artwork_category_1_id").val())
    select.options.add(new Option("Select Category"));
    for (index = 0; index < data.length; ++index) {
      option = data[index];
      select.options.add(new Option(option.name, option.id));
    }
  });

$("#artwork_category_2_id").change(function() {
    // make a POST call and replace the content
    select = document.getElementById('artwork_category_3_id');
    select.options.length = 0;
    data = getCategoryChildrenForSelect($("#artwork_category_2_id").val())
    select.options.add(new Option("Select Category"));
    for (index = 0; index < data.length; ++index) {
      option = data[index];
      select.options.add(new Option(option.name, option.id));
    }
  });

$("#artwork_category_3_id").change(function() {
    // make a POST call and replace the content
    select = document.getElementById('artwork_category_4_id');
    select.options.length = 0;
    data = getCategoryChildrenForSelect($("#artwork_category_3_id").val())
    select.options.add(new Option("Select Category"));
    for (index = 0; index < data.length; ++index) {
      option = data[index];
      select.options.add(new Option(option.name, option.id));
    }
  });

$("#artwork_category_4_id").change(function() {
    // make a POST call and replace the content
    select = document.getElementById('artwork_category_5_id');
    select.options.length = 0;
    data = getCategoryChildrenForSelect($("#artwork_category_4_id").val())
    select.options.add(new Option("Select Category"));
    for (index = 0; index < data.length; ++index) {
      option = data[index];
      select.options.add(new Option(option.name, option.id));
    }
  });
});