//= require jquery
//= require jquery_ujs
//= require jquery.purr
//= require best_in_place
//= require_tree .
jQuery.ajaxSetup({ 
  'beforeSend': function(xhr) {xhr.sendRequestHeader("Accept", "text/javascript")}
})

jQuery.fn.submitWithAjax = function() {
  this.submit(function() {
    $.post(this.action, $(this).serialize(), null, "script");
    return false;
  })
  return this;
};

$(document).ready(function (){
     $('#post-form').submit(function (){
       $.post($(this).attr('action'), $(this).serialize(), null, "script");
       return false;
     });
   });

