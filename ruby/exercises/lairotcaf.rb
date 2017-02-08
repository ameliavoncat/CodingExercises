require 'colorize'
exitPrompt = require_relative('../helpers/exitPrompt')
quitToMenu = require_relative('../helpers/quitToMenu')

def displayExitPrompt
  exitPrompt
end

def findNearestFactorial(number)
  current = 2
  total = 1
  while(number > total)
    total = current * total
    current += 1
  end
  current = current - 1
  if(number === total)
    puts(number.to_s.green + ' = '.green + current.to_s.yellow + '!'.yellow)
  else
    puts(number.to_s.green + ' has no factorial.'.yellow)
  end
end

puts('Enter a number to find its factorial.'.green)
input = gets.chomp
quitToMenu(input)

findNearestFactorial(input.to_i)

displayExitPrompt
