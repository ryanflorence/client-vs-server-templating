#=require jquery

##
# keeps track of our timers
@clock =
  keys: {}

  time: (key) ->
    start = new Date().getTime()
    end: => @push key, new Date().getTime() - start

  push: (key, time) ->
    (@keys[key] ?= []).push time

