if document.location.href.match(/https?:\/\/[^\/]+\/ds\//)
  jQuery ($) ->
    $("[href]").each ->
      if @href
        @href = @href.replace("http://www.bottledlight.com", "")
