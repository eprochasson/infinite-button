# Client-side code

# This function is called automatically once the websocket is setup
exports.init = ->

  SS.server.app.init (->)
    

  processMessage = (params) ->
    console.log("Params",params)
    $('span#connected')[0].innerHTML = params.connected
    $('span#pressing')[0].innerHTML = params.pressing
    if params.pressing > 0
      console.log(">0")
      $('#button').css('background-color', 'green')
    else
      console.log("<=0")
      $('#button').css('background-color', 'red')
    mousepos = params.mousepos
    for user,pos of mousepos
      if $('div#'+user).length == 0
        $('body').append('<div class="ghostpointer" id="'+user+'">')
        $('div#'+user).css('left',pos.x)
        $('div#'+user).css('top',pos.y)
      else
        $('div#'+user).css('left',pos.x)
        $('div#'+user).css('top',pos.y)


  # Bind to new incoming message event
  SS.events.on 'status', processMessage

