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

# credit https://twitter.com/#!/tcurdt/status/86193273055612929
