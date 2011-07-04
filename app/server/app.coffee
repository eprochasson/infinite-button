# Server-side code
whospressing = 0

exports.actions =

  init: (cb) ->
    @session.setUserId("user"+Math.random()*10)
    SS.users.online.now((data) ->
       SS.publish.broadcast 'status', { "connected" : data.length, "pressing" : whospressing }
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