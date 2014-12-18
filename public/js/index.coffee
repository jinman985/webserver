'use strict'

$(->
  socket = io.connect()

  socket.on 'badge', (badge)->
    $img = $('<img src="' + badge.badge_id + '" alt="Code School Badge">')
    $('body').prepend($img).prepend('<br>')
)
