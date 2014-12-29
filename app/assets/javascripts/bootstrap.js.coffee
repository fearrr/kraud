jQuery ->
  $("a[rel~=popover], .has-popover").popover()
  $("a[rel~=tooltip], .has-tooltip").tooltip()

  $(".top-menu li").click ->
    $(".top-menu li").removeClass('active');
    $(this).addClass('active');

#     ОПТИМИЗИРОВАТЬ --------------------------------
  $(".dropdown").hide();
  $('.drop').mouseover ->
    $(".dropdown").show();
  $('.dropdown').mouseover ->
    $(this).show();
  $('.drop').mouseleave ->
    $(".dropdown").hide();
  $('.dropdown').mouseleave ->
    $(this).hide();
#     ОПТИМИЗИРОВАТЬ --------------------------------

