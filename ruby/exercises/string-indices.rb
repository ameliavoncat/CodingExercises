require 'colorize'
exitPrompt = require_relative('../helpers/exitPrompt')
quitToMenu = require_relative('../helpers/quitToMenu')

def displayExitPrompt
  exitPrompt
end

puts('Enter a string.'.green)
string = gets
quitToMenu(string)
string = string.gsub!(/\n/, '').gsub!(/[^a-zA-Z]/, ' ').split(' ')

index = gets
quitToMenu(index)

if(index.to_i <= 0 || index.to_i > string.length)
  puts("''".green)
  displayExitPrompt
else
  puts(string[index.to_i - 1].green)
  displayExitPrompt
end
