require 'colorize'
exitPrompt = require_relative('../helpers/exitPrompt')
quitToMenu = require_relative('../helpers/quitToMenu')

def displayExitPrompt
  exitPrompt
end

def findClosestFibonacci(number, current, previous)
  if(number <= current+previous)
    return current
  else
    return findClosestFibonacci(number, current+previous, current)
  end
end

def checkNextClosest(number, total, nextClosest)
  if(number < (total + nextClosest))
    @fibonacciBases[nextClosest.to_s.to_sym] = 0
    return checkNextClosest(number, total, findClosestFibonacci(nextClosest, 1, 0))
  elsif(number === total + nextClosest)
    @fibonacciBases[nextClosest.to_s.to_sym] = 1
    return @fibonacciBases
  else
    total = total + nextClosest
    @fibonacciBases[nextClosest.to_s.to_sym] = 1
    return checkNextClosest(number, total, findClosestFibonacci(nextClosest, 1, 0))
  end
end

def fillInZeros(hash)
  number = hash.keys[-1].to_s.to_i
  nextFib = findClosestFibonacci(number, 1, 0).to_s.to_sym
  hash[nextFib] = 0

  if(nextFib.to_s.to_i > 1)
    return fillInZeros(hash)
  else
    return hash
  end
end

puts('Enter a number to convert it to base Fibonacci.'.green)
input = gets.chomp
quitToMenu(input)
input = input.to_i

if(input === 0)
  puts('Must enter a number greater than 0.'.red)
  displayExitPrompt
end

@fibonacciBases = {}

closestFib = findClosestFibonacci(input, 1, 0)
@fibonacciBases[closestFib.to_s.to_sym] = 1
result = checkNextClosest(input, closestFib, findClosestFibonacci(closestFib, 1, 0))
result = fillInZeros(result)

baseSequence = []
result.keys.each {|key| baseSequence.push(result[key])}

puts(input.to_s.green + "'s Fibonacci Base Sequence is: ".green + baseSequence.join('').yellow)

displayExitPrompt
