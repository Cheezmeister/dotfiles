$ ->
  bullsh = ->
    $(this).find('span.stat.view-count').text() == 'Recommended for you'

  wtf = ->
    $('li.video-list-item').
      filter(bullsh).
      css('filter', 'brightness(0%)').
      css('background', 'black')

  window.setTimeout wtf, 2000
