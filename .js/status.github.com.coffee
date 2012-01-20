FaviconSwitcher =
  title: document.title
  head: document.getElementsByTagName("head")[0]
  status: null
  check: ->
    if $('body').hasClass 'majorproblem'
      status = 'major'
    else if $('body').hasClass 'minorproblem'
      status = 'minor'
    else
      status = 'ok'
    if status != @status
      @change "http://dl.dropbox.com/u/9509054/github-favicon-#{status}.ico", "(#{status}) #{@title}"
  change: (iconURL, optionalDocTitle) ->
    if optionalDocTitle
      document.title = optionalDocTitle
    @addLink(iconURL, true)
  addLink: (iconURL) ->
    link = document.createElement("link")
    link.type = "image/x-icon"
    link.rel = "shortcut icon"
    link.href = iconURL
    @removeLinkIfExists()
    @head.appendChild(link)
  removeLinkIfExists: ->
    links = @head.getElementsByTagName("link")
    for link in links
      if (link.type=="image/x-icon" && link.rel=="shortcut icon")
        @head.removeChild(link)

# Run the first time straight away
$ -> FaviconSwitcher.check()

# Guarateed to run after local callbacks
$(window).ajaxComplete -> FaviconSwitcher.check()

