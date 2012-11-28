jQuery ($) ->
  $cover = $("#albumCover")
  $cover.wrap $("<a>").attr("href", $cover.find('img')[0].src)
