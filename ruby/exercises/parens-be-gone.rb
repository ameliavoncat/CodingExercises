require 'colorize'
exitPrompt = require_relative('../helpers/exitPrompt')
quitToMenu = require_relative('../helpers/quitToMenu')

def displayExitPrompt
  exitPrompt
end

def removeExtraParens(string)
  openParens = []
  previousMatch = {
    :open => '',
    :close => ''
  }

  string = string.split('')
  string.each_index {|index|
    character = string[index]
    if(character === '(')
      openParens.push(index)
    elsif(character === ')')
      openBracket = openParens.pop()
      if(openBracket === previousMatch[:open].to_i - 1 && previousMatch[:close].to_i === index - 1)
        string[openBracket] = ''
        string[index] = ''
      elsif(openBracket + 1 === index)
        string[openBracket] = ''
        string[index] = ''
      end
      previousMatch[:open] = openBracket
      previousMatch[:close] = index
    end
  }

  return string.join('')
end


puts('Enter an expression to correct.'.green)
input = gets.chomp
quitToMenu(input)
result = removeExtraParens(input)

puts('The corrected string is: '.green + result.yellow)

displayExitPrompt
