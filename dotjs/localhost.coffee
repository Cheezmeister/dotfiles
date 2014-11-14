# Reload after 5 sec
if (document.location.searchParams.has 'reload')
  window.setTimeout(( ->
    document.location.reload(true)
  ), 5000)

