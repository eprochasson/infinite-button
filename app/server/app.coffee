# Server-side code
whospressing = 0

exports.actions =

  logout: (cb) ->
    console.log(@session.user_id,"disconnected");

  init: (cb) ->
    @session.setUserId(("user"+Math.random()*10).replace("\.",""))
    SS.users.online.now((data) ->
       SS.publish.broadcast 'status', { "connected" : data.length, "pressing" : whospressing}
       cb true
    )

  userPress: (cb) ->
    whospressing += 1
    SS.users.online.now((data) ->
       SS.publish.broadcast 'status', { "connected" : data.length, "pressing" : whospressing }
       cb true
    )

  userRelease: (cb) ->
    whospressing -= 1 if whospressing > 0
    SS.users.online.now((data) ->
       SS.publish.broadcast 'status', { "connected" : data.length, "pressing" : whospressing }
       cb true
    )
