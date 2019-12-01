import os, strutils, tables

import day1_1

proc calculateAllFuel(mass: int): int =
  var lastFuel = mass
  while true:
    lastFuel = calculateFuel(lastFuel)
    if lastFuel <= 0: break
    result.inc(lastFuel)

when defined(test):
  doAssert calculateAllFuel(12) == 2
  doAssert calculateAllFuel(1969) == 966
  doAssert calculateAllFuel(100756) == 50346
  echo("Tests successful")

when isMainModule:
  var fuelTotal = 0
  for line in lines(getCurrentDir() / "inputs" / "day1_1.input"):
    fuelTotal.inc calculateAllFuel(line.parseInt())

  echo("Total fuel required: ", fuelTotal)