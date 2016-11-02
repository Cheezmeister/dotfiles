$ ->
  $('.blob-code-inner').map -> 
    console.log 'ey'
    $that = $(this)
    text = $that.text()
    
      # C/C++
      match = text.match /^#include "(.*)"/
      if match
        filename = match[1]
        $that.children('.pl-s').text "<a href=#{filename}>#{filename}</a>"