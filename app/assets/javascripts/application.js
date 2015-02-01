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
//= require bootstrap-datepicker
//= require ckeditor/init
//= require underscore
//= require parsley.min
//= require jquery.lightSlider
//= require simpleGal
//= require gmaps/google
//= require turbolinks
//= require_tree .

$(document).ready(function () {
    $('ul.top-menu a').each(function () {
        if (this.href == location.href) $(this).parent().addClass('active');
    });

    $('.datepicker').datepicker({
        format: "dd/mm/yyyy"
    });

    var slider = $("#lightSlider").lightSlider({
        gallery: true,
        item: 1,
        loop: true,
        slideWidth: 10,
        slideMargin: 1,
        thumbItem: 4,
        thumbMargin: 1,
        controls: false
    });
    $('#goToPrevSlide').click(function () {
        slider.goToPrevSlide();
    });
    $('#goToNextSlide').click(function () {
        slider.goToNextSlide();
    });

    window.ParsleyConfig = window.ParsleyConfig || {};
    window.ParsleyConfig.i18n = window.ParsleyConfig.i18n || {};
    window.ParsleyConfig.i18n.ru = $.extend(window.ParsleyConfig.i18n.ru || {}, {
        defaultMessage: "Некорректное значение",
        type: {
            email: "Введите адрес электронной почты",
            url: "Введите URL адрес",
            number: "Введите число",
            phone: "Введите номер телефона",
            integer: "Введите целое число",
            digits: "Введите только цифры",
            alphanum: "Введите буквенно-цифровое значение"
        },
        notblank: "Это поле должно быть заполнено",
        required: "Обязательное поле",
        pattern: "Введите номер телефона",
        min: "Это значение должно быть не менее чем %s",
        max: "Это значение должно быть не более чем %s",
        range: "Это значение должно быть в интервале от %s до %s",
        minlength: "Введите не менее %s символов",
        maxlength: "Введите не более %s символов",
        length: "Длина строки должна быть от %s до %s символов",
        mincheck: "Выберите не менее %s значений",
        maxcheck: "Выберите не более %s значений",
        check: "Выберите от %s до %s значений",
        equalto: "Это значение должно совпадать"
    });
    window.ParsleyValidator.addCatalog('ru', window.ParsleyConfig.i18n.ru, true);
});












