FaviconSwitcher =
  status: null
  init: ->
    @title = document.title
    @icon = $(document.head).find("link[rel=icon]")
    @checker()
  checker: ->
    @check()
    setTimeout((=> @checker()), 1000)
  check: ->
    if $('body').hasClass 'majorproblem'
      status = 'major'
    else if $('body').hasClass 'minorproblem'
      status = 'minor'
    else
      status = 'ok'
    if status != @status
      @status = status
      @change "http://dl.dropbox.com/u/9509054/github-favicon-#{status}.ico", "(#{status}) #{@title}"
  change: (iconURL, optionalDocTitle) ->
    document.title = optionalDocTitle if optionalDocTitle
    @icon.attr(href: iconURL)

# Run the first time straight away
$ -> FaviconSwitcher.init()

# Guaranteed to run after local callbacks
$(document).ajaxComplete ->
  console.log arguments
  FaviconSwitcher.check()

