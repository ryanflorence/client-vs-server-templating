#= require 'utils'
#= require 'clock'
#= require 'add_bar'

$ =>

  ##
  # add ?20 or ?<x> to the url to run {x} tests
  userNumber = parseInt window.location.search.replace(/^\?/, ''), 10

  ##
  # custom parseJSON method so we can time it
  parseJSON = (string) ->
    timer = clock.time 'client parseJSON'
    json = $.parseJSON string
    timer.end()
    json

  ##
  # The client-side json request
  @renderClient = ->
    count++
    target.empty().html 'waiting...'

    # our timers
    totalTimer = clock.time 'client total'
    reqTimer = clock.time 'client response'

    # the actual client side rendering request, note that its
    # pretty much identical to the server-side html request
    $.ajax
      url: '/whatevs/api?' + new Date().getTime()
      dataType: 'json'
      converters: 'text json': parseJSON
    .done (whatevs) ->
      reqTimer.end()
      renderTimer = clock.time 'client render'

      # the only real difference between client v. server is this line
      render Handlebars.templates.whatevs whatevs: whatevs

      renderTimer.end()
      totalTimer.end()
      setTimeout next

  ##
  # The server-side html request
  @renderServer = ->
    count++
    target.empty().html 'waiting...'

    # our timers
    totalTimer = clock.time 'server total'
    reqTimer = clock.time 'server response'

    # the server-side html request
    $.ajax
      url: '/whatevs/api?' + new Date().getTime()
      dataType: 'html'
    .done (text) ->
      reqTimer.end()
      renderTimer = clock.time 'server render'

      # no extra step to convert JSON to html, just render the response
      render text

      renderTimer.end()
      totalTimer.end()
      setTimeout next

  ##
  # Rotates between client and server responses
  next = ->
    if count > numberOfTests
      report()
    else if count % 2
      renderServer()
    else
      renderClient()

  ##
  # how many requests to make
  numberOfTests = if isNaN(userNumber) then 20 else userNumber

  ##
  # div we dump html into
  target = $ '#target'

  ##
  # how we put html into the element
  render = (html) ->
    # straight up innerHTML that sucker
    target[0].innerHTML = html

  ##
  # report the results
  @report = ->
    target.empty()
    target.addBar 'server', 'render'
    target.addBar 'client', 'render'
    target.append '<br>'
    target.addBar 'server', 'response'
    target.addBar 'client', 'response'
    target.append '<br>'
    target.addBar 'server', 'total'
    target.addBar 'client', 'total'
    target.append '<br>'
    target.addBar 'client', 'parseJSON'

  ##
  # counts how close we are to numberOfTests
  count = 0

  ##
  # Kick the requests off
  $(window).load renderClient

