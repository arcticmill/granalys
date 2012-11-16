carrier = require 'carrier'

values = {}
process.stdin.on 'end', () ->
  for path, times of values
    console.log path, times.reduce((acc, cur) -> acc + cur)/times.length

process.stdin.resume()
carrier.carry process.stdin, (line) ->
  {method, path, time, status} = JSON.parse line
  unless path of values
    values[path] = []
  values[path].push time
