import sequtils, strutils, sugar, os

proc parseInput*(data: string): seq[int] =
  data.split(",").map(x => x.parseInt())

proc readOperands(data: var seq[int], currentPos: var int): (int, int, int) =
  inc(currentPos)
  let first = data[currentPos]
  inc(currentPos)
  let second = data[currentPos]
  inc(currentPos)
  let dest = data[currentPos]
  inc(currentPos)
  return (first, second, dest)

proc execute(data: var seq[int], currentPos: var int): bool =
  ## Execute the opcode at `currentPos`. Returns true if `99` reached.
  let opcode = data[currentPos]
  case opcode
  of 1:
    # add
    let (first, second, dest) = readOperands(data, currentPos)
    data[dest] = data[first] + data[second]
  of 2:
    # Mult
    let (first, second, dest) = readOperands(data, currentPos)
    data[dest] = data[first] * data[second]
  of 99:
    return true
  else: assert false

proc executeAll*(data: var seq[int]) =
  var currentPos = 0
  while not execute(data, currentPos): discard

when defined(test):
  proc testExecution(input: string, output: string) =
    var data = input.parseInput()
    executeAll(data)
    echo(data)
    doAssert data.join(",") == output

  testExecution("1,0,0,0,99", "2,0,0,0,99")
  testExecution("2,3,0,3,99", "2,3,0,6,99")
  testExecution("2,4,4,5,99,0", "2,4,4,5,99,9801")
  testExecution("1,1,1,4,99,5,6,0,99", "30,1,1,4,2,5,6,0,99")

when isMainModule:
  var data = readFile(getCurrentDir() / "inputs" / "day2_1.input").parseInput()
  data[1] = 12
  data[2] = 2
  data.executeAll()
  echo("Output: ", data[0])
