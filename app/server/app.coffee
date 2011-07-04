# Server-side code
whospressing = 0

mousepos = {}



exports.actions =

  logout: (cb) ->
    console.log(@session.user_id,"disconnected XXXXXXXXXXXXXXXXXXXXX");
    delete mousepos[@session.user_id]

  init: (cb) ->
    @session.setUserId(("user"+Math.random()*10).replace("\.",""))
    SS.users.online.now((data) ->
       SS.publish.broadcast 'status', { "connected" : data.length, "pressing" : whospressing, "mousepos": mousepos }
       cb true
    )

  userPress: (cb) ->
    whospressing += 1
    SS.users.online.now((data) ->
       SS.publish.broadcast 'status', { "connected" : data.length, "pressing" : whospressing, "mousepos":mousepos }
       cb true
    )

  userRelease: (cb) ->
    whospressing -= 1 if whospressing > 0
    SS.users.online.now((data) ->
       SS.publish.broadcast 'status', { "connected" : data.length, "pressing" : whospressing, "mousepos":mousepos }
       cb true
    )

  updateMousePosition: (params,cb) ->
    mousepos[@session.user_id] = { x: params.x, y: params.y }