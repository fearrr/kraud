jQuery ->
  $("a[rel~=popover], .has-popover").popover()
  $("a[rel~=tooltip], .has-tooltip").tooltip()

  $(".bxslider").bxSlider({
    auto:true,
    pager:false,
    autoDelay: 1000,
    mode: 'fade',
    captions: true
  })


