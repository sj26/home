parseDuration = (duration) ->
  # .75
  if match = /^\.\d+$/.exec(duration)
    parseFloat("0" + match[0]) * 3600
  # 4 or 11.75
  else if (match = /^\d+(?:\.\d+)?$/.exec(duration))
    parseFloat(match[0]) * 3600
  # 01:34
  else if (match = /^(\d+):(\d+)$/.exec(duration))
    (parseInt(match[1]) || 0) * 3600 + (parseInt(match[2]) || 0) * 60
  # 1h30m or 7 hrs 1 min and 43 seconds
  else if match = /(?:(\d+)\s*d(?:ay?)?s?)?(?:(?:\s+and|,)?\s+)?(?:(\d+)\s*h(?:(?:ou)?rs?)?)?(?:(?:\s+and|,)?\s+)?(?:(\d+)\s*m(?:in(?:utes?))?)?(?:(?:\s+and|,)?\s+)?(?:(\d+)\s*s(?:ec(?:ond)?s?)?)?/.exec(duration)
    (parseInt(match[1]) || 0) * 86400 + (parseInt(match[2]) || 0) * 3600 + (parseInt(match[3]) || 0) * 60 + (parseInt(match[4]) || 0)

parseDurationIntoHours = (duration) ->
  # Special cases so we don't lose precision during round trips
  if match = /^\.\d+$/.exec(duration)
    parseFloat "0" + match[0]
  else if match = /^\d+(?:\.\d+)?$/.exec(duration)
    parseFloat match[0]
  else
    parseDuration(duration) / 3600

formatDuration = (hours) ->
  hoursOnly = Math.floor hours
  duration = ''

  if hoursOnly > 0
    duration += hoursOnly + 'h'

  if hoursOnly < hours
    minutesOnly = (hours - hoursOnly) * 60
    if duration
      duration += ' '
    duration += minutesOnly + 'm'

  duration or '0h'

do ->
  sum = (a, b) -> a + b
  Array::sum = -> @reduce(sum)
  Array::unique = ->
    memo = []
    for el, i in @
      memo.push el if i is 0 or memo.indexOf(el) < 0
    memo

calculateDayTotals = ->
  $('#content table tbody tr.subtotal').remove()

  rows = $('#content table tbody tr td:first-of-type')
  dates = rows.map(-> return $(@).text())
  uniqueDates = dates.toArray().sort().unique()
  console.log {rows, dates, uniqueDates}

  $.each uniqueDates, (i, date) ->
    dateRows = $('#content table tbody tr:has(td:contains(' + date + '))')
    durationCells = dateRows.find('td:nth-child(6)')
    durations = durationCells.map -> parseDuration($.trim($(this).text().split(/\(/, 1)[0]))
    duration = durations.toArray().sum() / 3600
    subtotalRow = $ "<tr class=\"subtotal\"><th>#{date}</th><th colspan=\"4\">TOTAL</th><th>#{formatDuration(duration)}</th><th>&nbsp;</th></tr>"
    finalDateRow = dateRows.last()
    console.log {dateRows, durationCells, durations, duration, subtotalRow, finalDateRow}
    if dateRows.length
      subtotalRow.hide().insertAfter(finalDateRow).slideDown()

jQuery ($) ->
  if document.location.pathname.match(/\/hour_entries$/)
    $loadMoreEntries = $('<a/>').attr('href', '#').data('page', 2).text('More entries...').insertAfter('#content table').wrap($('<div/>').addClass('loadMoreEntries'))
    $loadingMoreEntries = $('<div/>').text('Loading more entries...').addClass('loadingMoreEntries').hide().insertAfter($loadMoreEntries)

    loadMoreEntries = ->
      $loadMoreEntries.hide()
      $loadingMoreEntries.show()
      page = parseInt($loadMoreEntries.data('page'))
      $.get document.location.pathname + "?page=" + page.toString(), (data) ->
        # Fix dodgy HTML tag
        data = data.replace("</html>", "") + "</html>"
        $(data).filter('#content').find('table tbody').children().appendTo('#content table tbody')
        calculateDayTotals()
        $loadMoreEntries.data('page', page + 1).show()
        $loadingMoreEntries.hide()

    $loadMoreEntries.click (e) ->
      e.preventDefault()
      loadMoreEntries()

    $(window).scroll (e) ->
      docViewTop = $(window).scrollTop()
      docViewBottom = docViewTop + $(window).height()

      elemTop = $loadMoreEntries.offset().top
      elemBottom = elemTop + $loadMoreEntries.height()

      if $loadMoreEntries.is(":visible") && (elemBottom >= docViewTop) && (elemTop <= docViewBottom) && (elemBottom <= docViewBottom) &&  (elemTop >= docViewTop)
        loadMoreEntries()

    calculateDayTotals()
    $('nav.pagination').hide()
