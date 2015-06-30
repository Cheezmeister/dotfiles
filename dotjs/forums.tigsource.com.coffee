$ ->
  $form = $('#postmodify')
  $form.append('<button id="convertbutton">Post as Markdown</button>')
  $('#convertbutton').click ->
    $textbox = $('#postmodify textarea')
    text = $textbox.val().
    # This monstrous blob was swiped from https://github.com/feralhosting/markdown-to-bbcode/blob/master/index.html
      replace(/\[(.+?)\]\((.+?)(\s".*")?\)/gmi,'[url=$2]$1[/url]') .
      replace(/^(.+)(\n|\r\n)([=]{3,3}\s*(\n|\r\n)?)$/gmi, "[h1]$1[/h1]") .
      replace(/^(.+)(\n|\r\n)([-]{3,3}\s*(\n|\r\n)?)$/gmi, "[h2]$1[/h2]") .
      replace(/^[#]{6,6}\s*(.*[^\s])\s*[#]{6,6}\n?$/gmi, "[h6]$1[/h6]") .
      replace(/^[#]{6,6}\s*(.*)\n?$/gmi, "[h6]$1[/h6]") .
      replace(/^[#]{5,5}\s*(.*[^\s])\s*[#]{5,5}\n?$/gmi, "[h5]$1[/h5]") .
      replace(/^[#]{5,5}\s*(.*)\n?$/gmi, "[h5]$1[/h5]") .
      replace(/^[#]{4,4}\s*(.*[^\s])\s*[#]{4,4}\n?$/gmi, "[h4]$1[/h4]") .
      replace(/^[#]{4,4}\s*(.*)\n?$/gmi, "[h4]$1[/h4]") .
      replace(/^[#]{3,3}\s*(.*[^\s])\s*[#]{3,3}\n?$/gmi, "[h3]$1[/h3]") .
      replace(/^[#]{3,3}\s?(.*)\n?$/gmi, "[h3]$1[/h3]") .
      replace(/^\`{3,3}(.*)\n((?:.|\n)+?)\n\`{3,3}\n?$/gmi, "[code]$2[/code]")   .
      replace(/^\~{3,3}(.*)\n((?:.|\n)+?)\n\~{3,3}\n?$/gmi, "[code]$2[/code]")   .
      replace(/\`([^\`].*?)\`/gmi, "[code single]$1[/code]")  .
      replace(/\[!\[.*?\]\((.*?)\)\]\((.*?)\)/gmi,'[img]$1[/img]\nClickable image was pointing to [url=$2]here[/url]') .
      replace(/!\[(.*)\]\((.*)\)/gmi,'[img]$2[/img]') .
      replace(/\*\*\*([^\*].*?)\*\*\*/gmi, "[b][i]$1[/i][/b]") .
      replace(/\*\*([^\*].*?)\*\*/gmi, "[b]$1[/b]") .
      replace(/(\s)\*((?!\/[0-9]|\s|\*).*?)\*(\s)/gmi, "$1[i]$2[/i]$3")
    $textbox.val(text)

