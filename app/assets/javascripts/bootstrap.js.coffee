jQuery ->
  $("a[rel~=popover], .has-popover").popover()
  $("a[rel~=tooltip], .has-tooltip").tooltip()

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


