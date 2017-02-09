require 'colorize'
exitPrompt = require_relative('../helpers/exitPrompt')
quitToMenu = require_relative('../helpers/quitToMenu')

@accumulator = []

def displayExitPrompt
  exitPrompt
end

def findUniqueCharacters(array)
  newArray = []
  array.each {|item|
    if(!newArray.find_index(item))
      newArray.push(item)
    end
  }
  return newArray
end

def heapsAlgorithm(n, array, accumulator)
  p(array)
  if(n == 1)
    accumulator << array.clone
  else
    for i in 0..n
      heapsAlgorithm(n-1, array, accumulator)
      j = n.even? ? i : 0
      array[j], array[n-1] = array[n-1], array[j]
    end
  end
end

def getPermutations(array)
  accumulator = []
  heapsAlgorithm(array.count, array.clone, accumulator)
  return accumulator
end

def rearrangeItems(first, array, baseArray)
  array.push(first)
  return array
end

def getPermutations(n)
  p = Array.new(n+1){|i| -i}
  s = 1
  loop do
    yield p[1..-1].map(&:abs), s
    k = 0
    for i in 2..n
      k = i if p[i] < 0 and p[i].abs > p[i-1].abs and p[i].abs > p[k].abs
    end
    for i in 1...n
      k = i if p[i] > 0 and p[i].abs > p[i+1].abs and  p[i].abs > p[k].abs
    end
    break if k.zero?
    for i in 1..n
      p[i] *= -1 if p[i].abs > p[k].abs
    end
    i = k + (p[k] <=> 0)
    p[k], p[i] = p[i], p[k]
    s = -s
  end
end

def convertBackToString(indexArray, inputArray)
  stringArray = []
  indexArray.each {|index|
    subArray = []
    index.each {|subIndex|
      subArray.push(inputArray[subIndex -1])
    }
    stringArray.push(subArray.join)
  }
  return stringArray
end

puts('Enter a string to see its permutations.'.green)
input = gets.chomp
quitToMenu(input)

inputArray = input.split('')

inputArray = findUniqueCharacters(inputArray)
getPermutations(inputArray.size){|result| @accumulator.push(result)}

result = convertBackToString(@accumulator, inputArray).join(' ')

puts('The unique characters in '.green + input.to_s.green + ' have '.green + @accumulator.size.to_s.yellow + ' unique permuations.'.green)
puts('Permutations: '.green + result.yellow)

displayExitPrompt
