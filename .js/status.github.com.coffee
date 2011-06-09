FaviconSwitcher =
  title: document.title
  status: null
  check: ->
    if $('body').hasClass 'majorproblem'
      status = 'major'
    else if $('body').hasClass 'majorproblem'
      status = 'minor'
    else
      status = 'ok'
    if status != this.status
      this.change "http://dl.dropbox.com/u/9509054/github-favicon-#{status}.ico", "(#{status}) #{this.title}"
  change: (iconURL, optionalDocTitle) ->
    if optionalDocTitle
      document.title = optionalDocTitle
    this.addLink(iconURL, true)
  addLink: (iconURL) ->
    link = document.createElement("link")
    link.type = "image/x-icon"
    link.rel = "shortcut icon"
    link.href = iconURL
    this.removeLinkIfExists()
    this.docHead.appendChild(link)
  removeLinkIfExists: ->
    links = this.docHead.getElementsByTagName("link")
    for link in links
      if (link.type=="image/x-icon" && link.rel=="shortcut icon")
        this.docHead.removeChild(link)
  docHead: document.getElementsByTagName("head")[0]

# Run the first time straight away
$ -> FaviconSwitcher.check()

# Guarateed to run after local callbacks
$(window).ajaxComplete -> FaviconSwitcher.check()

