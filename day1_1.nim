import math, os, strutils

proc calculateFuel*(mass: int): int =
  floor(mass / 3).int - 2

when defined(test):
  doAssert calculateFuel(12) == 2
  doAssert calculateFuel(14) == 2
  doAssert calculateFuel(1969) == 654
  doAssert calculateFuel(100756) == 33583
  echo("Tests successful")

when isMainModule:
  var fuelTotal = 0
  for line in lines(getCurrentDir() / "inputs" / "day1_1.input"):
    fuelTotal.inc calculateFuel(line.parseInt())

  echo("Total fuel required: ", fuelTotal)