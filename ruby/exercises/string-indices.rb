require 'colorize'
exitPrompt = require_relative('../helpers/exitPrompt')
quitToMenu = require_relative('../helpers/quitToMenu')

def displayExitPrompt
  exitPrompt
end

puts('Enter a string.'.green)
string = gets
quitToMenu(string)
string.gsub!(/\n/, '').gsub!(/[^a-zA-Z]/, ' ')
string = string.split(' ')

puts('Enter the non-zero index of the word to find.'.green)
index = gets.chomp
quitToMenu(index)

if(index.to_i <= 0 || index.to_i > string.length)
  puts("Result: ".green + "''".yellow)
  displayExitPrompt
else
  puts("Result: ".green + string[index.to_i - 1].yellow)
  displayExitPrompt
end
