require 'colorize'
exitPrompt = require_relative('../helpers/exitPrompt')
quitToMenu = require_relative('../helpers/quitToMenu')

def displayExitPrompt
  exitPrompt
end


puts('Enter an expression to correct.'.green)
input = gets.sub(/\n/, '')
quitToMenu(input)

puts(input)
input.gsub!(/\({2,}/, '(').gsub!(/\){2,}/, ')')

puts('Parens corrected!'.green)
puts(input.green)

displayExitPrompt
