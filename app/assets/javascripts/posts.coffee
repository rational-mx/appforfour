already = false
jQuery ->
  $("#post_body").keyup ->
    AnalizePostBody($("#post_body").val()) if !already

AnalizePostBody = (body) ->
  youtube_key = body.match /www.youtube.com.watch.v=(\w{11})/
  $("#post_media_url").val(youtube_key[1])
  InsertYoutube($("#media-insert"), youtube_key[1])
  already = true

InsertYoutube = (container, youtube_key) ->
  container.html "<embed width= '320' height='190' src = 'http://www.youtube.com/v/" + youtube_key + "'>"


#https://www.youtube.com/watch?v=o67XXwVrts4