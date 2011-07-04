# Client-side code

# This function is called automatically once the websocket is setup
exports.init = ->

  SS.server.app.init (user) ->
    if user then $('#main').show() else displaySignInForm()

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

  # Bind to new incoming message event
  SS.events.on 'status', processMessage