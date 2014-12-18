'use strict'

axon = require 'axon'
socket = axon.socket 'sub'

socket.connect 1338

socket.on 'error', (err)->
  throw err

module.exports = socket
