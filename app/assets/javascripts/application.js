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
//= require jquery.turbolinks
//= require jquery_ujs
//= require bxslider
//= require twitter/bootstrap
//= require ckeditor/init
//= require underscore
//= require jquery.colorbox
//= require jquery.lightSlider
//= require simpleGal
//= require gmaps/google
//= require turbolinks
//= require_tree .

$(document).ready(function(){
    $('#lightSlider a').colorbox({rel:'gal'});
    $('ul.top-menu a').each(function () {
        if (this.href == location.href) $(this).parent().addClass('active');
    });

    var slider = $("#lightSlider").lightSlider({
        gallery: true,
        item: 1,
        loop:true,
        slideWidth:10,
        slideMargin: 1,
        thumbItem: 4,
        thumbMargin:1,
        controls:false
    });
    $('#goToPrevSlide').click(function(){
        slider.goToPrevSlide();
    });
    $('#goToNextSlide').click(function(){
        slider.goToNextSlide();
    });
});









