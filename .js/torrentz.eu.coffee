jQuery ($) ->
  # Remove spammy sponsored link
  $(".download dl:has(dd:contains('Sponsored Link'))").remove()

  filename = $('.download h2:first span:first').text()
  size = $('.files [title]:first').attr('title').replace(/[,b]/g, "")
  hash = $('.trackers div:first').text().split(" ")[1]
  trackers = $('.trackers dl:not(:contains("DHT")) dt').map -> $(@).text()

  uri = "magnet:?xt=urn:btih:#{encodeURIComponent hash}&dn=#{encodeURIComponent filename}&xl=#{encodeURIComponent size}"

  if trackers.length == 1
    uri += "&tr=#{encodeURIComponent trackers[0]}"
  else if trackers.length > 1
    uri += "&" + $.map(trackers, (tracker, i) -> "tr.#{i + 1}=#{encodeURIComponent tracker}").join("&")

  $("""<dl><dt><a rel="e" target="_blank"><span class="u">magnet</span><span class="n"></span></a></dt></dl>""")
    .find('a').attr('href', uri).removeAttr('target').end()
    .find('.n').text(filename).end()
    .insertAfter('.download h2:first')
