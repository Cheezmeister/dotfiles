$ ->
  number = window.location.pathname.replace /\//g, ''
  link = $('#comic').append "<br><a href='http://www.explainxkcd.com/wiki/index.php/#{number}'>Explain</a>"
