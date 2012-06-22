#=require jquery
#=require clock

$.fn.addBar = (method, key) ->
  times = clock.keys["#{method} #{key}"]
  width = times.average().round(4)

  bar = $ '<div/>'
  bar.addClass method

  bar.css
    width: width
    padding: '5px'

  bar.html "#{method} #{key}: <span class='number'>#{width} ms</span>"
  this.append bar

  # browserscope beacon in nanoseconds
  k = "#{method} #{key}"
  ns = (times.average() * 1000000).round(0)
  window._bTestResults[k] = "#{ns}"
