$ ->
  linkText = 'Direct Link'
  embed = $('#ytplayer')
  url = embed.attr 'data'
  parts = url.split('&')[0].split('/')
  youtubeId = parts[parts.length - 1]
  embed.parent().parent().append "<a class='main' href='http://www.youtube.com/watch?v=#{youtubeId}'>#{linkText}</a>"
  

