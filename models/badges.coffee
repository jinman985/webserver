'use strict'

request = require 'request'

exports.get = (callback)->
  request 'http://localhost:1337/badges', (err, res, body)->
    callback err, JSON.parse(body)
