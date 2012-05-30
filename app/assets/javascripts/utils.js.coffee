##
# simple reduce, yeah, killed native prototype
Array::average = ->
  total = 0
  total += item for item in this
  total / this.length

##
# Round numbers
Number::round = (precision) ->
  precision = Math.pow(10, precision || 0)
    .toFixed(if precision < 0 then -precision else 0)
  Math.round(this * precision) / precision

