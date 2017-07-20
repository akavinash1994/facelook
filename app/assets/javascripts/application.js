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

  $(document).ready(function(){
    $(".like_link").click(function(e){
      url = $(this).data('url')
      obj = $(this)
      // document.getElementById("count").innerHTML="";
     // authenticity_token
     debugger;
      e.preventDefault();
      $.ajax({            
           url: url + "?&authenticity_token=" + AUTH_TOKEN,
           type: "POST",//type of posting the data
           data: 'json',
           success: function (data) {
            debugger;
            // document.getElementById("count").innerHTML=data.count;
            obj.find('.votes-count').text(data.count)
           },
           error: function(xhr, ajaxOptions, thrownError){
           },
      });

    });


    $("#comment").click(function(){
        $("#panel").slideToggle("slow");
    });

  });
