'use strict'

express = require 'express'
app = express()
server = require('http').createServer(app)
io = require('socket.io').listen(server)
badges = require './models/badges'

subSocket = require './lib/subscribe'

server.listen 3000, ->
  console.log 'Listening...'

app.use(express.static('public'))

app.get '/', (req, res)->
  res.sendfile('./public/index.html')

io.sockets.on 'connection', (socket)->
  badges.get (err, data)->
    if err
      return
    data.forEach (badge)->
      socket.emit 'badge', badge

subSocket.on 'message', (message)->
  io.sockets.emit 'badge', message
