require 'colorize'
exitPrompt = require_relative('../helpers/exitPrompt')
quitToMenu = require_relative('../helpers/quitToMenu')

def displayExitPrompt
  exitPrompt
end

puts('Enter the text to disemvowl.'.green)
input = gets.sub(/\n/, '')
quitToMenu(input)

input.gsub!(/[aeiouAEIOU]|\s/, '')

puts('The disemvowled text is: '.green + input.to_s.yellow)

displayExitPrompt
