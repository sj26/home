if (actions = $(".repohead .pagehead-actions")).length
  [_, username, repo] = document.location.pathname.split('/', 3)
  actions.prepend("<li><a href='http://rubygems.org/gems/#{repo}' class='minibutton'><span>Rubygems</span></a></li>")
  actions.prepend("<li><a href='http://rdoc.info/github/#{username}/#{repo}/frames' class='minibutton'><span>Rubydoc</span></a></li>")

# if I'm in a repo
slashcount = window.location.href.split("/").length
if slashcount >= 5 # we are in a repo
  # find a top level LICENSE* or LICENCE* file
  licenseurl = $('a[href*="LICENSE"], a[href*="LICENCE"]').attr("href")
  $.get licenseurl, null, (data, status, result) ->
    # grep it for *GPL*
    if data.match(/(gpl|GNU General Public)/i)
      # paint red tape
      $("<h2>Watch out, this repository contains GPL licensed code!</h2>")
        .css
          "background-color": "rgba(255, 0, 0, 0.7)",
          "color": "#FF0",
          "text-shadow": "2px 2px #000000",
          "text-align": "center",
          "display": "none",
          "position": "fixed",
          "width": "100%",
          "z-index": 1000,
        .prependTo($('body'))
        .fadeIn("slow")

$('body.page-pullrequest, body.page-commit-show').live 'click', '.diff-view .file .meta .info', (e) ->
  $(e.target).parents('.file').first().find('.data').toggle()

# credit https://twitter.com/#!/tcurdt/status/86193273055612929
# nabbed from https://github.com/freelancing-god/.js/blob/master/github.com.js
