# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

numberOfTests = 10

$ ->

  target = $ '#target'

  render = (html) ->
    target.html html

  data =
    keys: {}
    time: (key) ->
      start = Date.now()
      end: => @push key, Date.now() - start
    push: (key, time) ->
      (@keys[key] or= []).push time
    report: ->
      for key, times of @keys
        total = times.reduce (prev, curr) -> prev + curr
        console.log key, 'avg', total / times.length, 'out of', times.length

  count = 0

  renderClient = ->
    count++
    target.empty().html 'waiting...'
    timer = data.time 'client total'
    reqTimer = data.time 'client response'
    $.getJSON '/whatevs/api', (whatevs) ->
      reqTimer.end()
      renderTimer = data.time 'client render'
      render Handlebars.templates.whatevs whatevs: whatevs
      renderTimer.end()
      timer.end()

      # render client 100 times, then the server
      setTimeout ->
        if count is numberOfTests
          count = 0
          renderServer()
        else
          renderClient()

  renderServer = ->
    count++
    target.empty().html 'waiting...'
    timer = data.time 'server total'
    reqTimer = data.time 'server response'
    $.get '/whatevs/api', (text) ->
      reqTimer.end()
      renderTimer = data.time 'server render'
      render text
      renderTimer.end()
      timer.end()

      setTimeout ->
        if count is numberOfTests
          data.report()
        else
          renderServer()

  $(window).load ->
    renderClient()

