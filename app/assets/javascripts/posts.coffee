already = false
$(document).on "ready page:change", ->
  $("#post_body").keyup ->
    AnalizePostBody($("#post_body").val()) if !already

$(window).scroll ->
  if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight)
    $('#more_comments').click()
    $('#more_comments').hide()


$(document).on "ready page:change", ->
  $('#more_comments').hide()

AnalizePostBody = (body) ->
  youtube_key = body.match /www.youtube.com.watch.v=(\w{11})/
  if youtube_key != null
  	$("#post_media_url").val(youtube_key[1])
  	InsertYoutube($("#media-insert"), youtube_key[1])
  	already = true 
  else
    
InsertLink = (container, url_link) ->
    #Check regex has problems with larg urls
    url = body.match /^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$/
    $("#post_media_url").val(url[0])
  	InsertLink($("#media-insert"), url[0])
  	if url != null
      already = true 
  $("#post_media_url").val("<a href='"+url_link+"''>"+url_link+"</a>")
  container.html "<a href='"+url_link+"''>"+url_link+"</a>"

  

InsertYoutube = (container, youtube_key) ->
  $("#post_media_url").val("<embed width= '320' height='190' src = 'http://www.youtube.com/v/" + youtube_key + "'>")
  container.html "<embed width= '320' height='190' src = 'http://www.youtube.com/v/" + youtube_key + "'>"


#https://www.youtube.com/watch?v=o67XXwVrts4