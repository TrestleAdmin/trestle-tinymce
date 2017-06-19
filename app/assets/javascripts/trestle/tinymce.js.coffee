Trestle.TinyMCE = {}

Trestle.ready ->
  init = ->
    if tinyMCE?
      tinyMCE.init(Trestle.TinyMCE.default)
    else
      setTimeout(init, 50)

  init()
