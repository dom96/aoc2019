import os

import day2_1

when isMainModule:
  let originalData = readFile(getCurrentDir() / "inputs" / "day2_1.input").parseInput()
  for i in 0 .. 99:
    for j in 0 .. 99:
      var data = originalData
      data[1] = i
      data[2] = j
      data.executeAll()
      if data[0] == 19690720:
        echo("Noun: ", i, " Verb: ", j)
        echo("Output: ", 100 * i + j)
        break