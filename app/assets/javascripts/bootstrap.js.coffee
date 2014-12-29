jQuery ->
  $("a[rel~=popover], .has-popover").popover()
  $("a[rel~=tooltip], .has-tooltip").tooltip()

  $(".top-menu li").click ->
    $(".top-menu li").removeClass('active');
    $(this).addClass('active');