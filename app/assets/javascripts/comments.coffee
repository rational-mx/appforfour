number_of_comments = 5

$(document).on "ready page:change", ->
  $("#submit_comment").on "click", ->
    ConvertAllLinks()

    

ConvertAllLinks = () ->
  comment =  $('#comment_body').val()
  words = comment.split(' ')
  for i in [0..words.length] by 1
    words[i] = IsLinK(words[i])
  words = words.join(' ')
  $('#comment_body').val(words)


IsLinK = (word) ->
  if /^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$/.test(word) 
    "<a href='"+word+"'>"+ word + "</a>"
  else
    word
