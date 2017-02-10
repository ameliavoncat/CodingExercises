require 'colorize'
exitPrompt = require_relative('../helpers/exitPrompt')
quitToMenu = require_relative('../helpers/quitToMenu')

@computerNumber

def generateNumber
  @computerNumber = Random.rand(100)
end

def promptForInput
  @input = gets.sub(/\n/, '')
  quitToMenu(@input)

  if (@input.to_i == @computerNumber)
    puts("You got the right number!".yellow)
    exitPrompt
  else
    puts("Guess again!".green)
    promptForInput
  end
end

puts("Guess the number I'm thinking of!".green)
generateNumber
promptForInput
