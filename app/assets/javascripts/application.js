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
//= require turbolinks
//= require jquery
//= require bootstrap
//= require_tree .

var AUTH_TOKEN = $('meta[name=csrf-token]').attr('content');
$(document).on('turbolinks:load', function() {
  $(".like_link").click(function(e){
    url = $(this).data('url')
    obj = $(this)
    e.preventDefault();
    $.ajax({
      url: url + "?&authenticity_token=" + AUTH_TOKEN,
      type: "POST",
      data: 'json',
      success: function (data) {
        obj.find('.votes-count').text(data.count)
      },
      error: function (xhr, ajaxOptions, thrownError) {
      },
    });

  });

  $(".comment-icon").click(function(e){
    $(this).next().slideToggle("slow");
  });
});

function submitComment(event){
  url = $(event).parent().children('.comment_url').val();
  dataType = 'html';
  obj = $(event);
  $.ajax({
    url: url,
    type: 'POST',
    data: {'content' : obj.parent().children('.comment_content_class').val() },
    success:  function (data) {
      obj.closest('.panel-footer').siblings('.panel-body').find('.last-comment').html(data.view);
    }, 
    error: function (xhr, ajaxOptions, thrownError) {
    }, 
  });
}

function startSearching(event){ 
  url = $(event).siblings('.search_url').val();
  obj = $(event);
  $.ajax({
    url: url,
    type: 'GET',
    data: {'first_name' : obj.val()},
    success: function (data) {
      obj.siblings('.dropdown-menu').children('.search_result').empty();
      for ( i=0; i<data.result.length; i++){
        obj.siblings('.dropdown-menu').children('.search_result').append("<br><a href='users/"+ data.result[i].id + "' method='get' >" + data.result[i].first_name + "</a>")
      }
    },
    error: function (xhr, ajaxOptions, thrownError){
    },
  });
} 

function toggleFriendStatus(event){
  url = $(event).data('url');
  obj = $(event);
  $.ajax({
    url: url,
    type: 'POST',
    data: 'json',
    success: function (data) {
      obj.parent().html(data.view)
    },
    error: function (xhr, ajaxOptions, thrownError){
    },
  });
}