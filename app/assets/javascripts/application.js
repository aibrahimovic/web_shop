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
//= require jquery.rambling.slider
//= require_tree .
//= require magnific-popup

$(window).bind('page:load', function(){
    //alert("Test");
   
    /*$.ajax({
        url: '/application/get_counter',
        type: 'GET',
        success: function(result) {
            if (result.counter == 0) {
                $('.counter').css('visibility', 'hidden');
            }
            else 
                $('.counter').css('visibility', 'visible');
        }
    });*/

    $('.active').css('border-bottom', '2px solid #F0D234');
    $('.active').css('color', 'white');

});
