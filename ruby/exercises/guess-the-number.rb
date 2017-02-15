require 'colorize'
require_relative('../helpers/exitPrompt')
require_relative('../helpers/quitToMenu')

class GuessTheNumber

  def initialize
    @computerNumber = generateNumber
  end

  def generateNumber
    Random.rand(100)
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

  def start!
    puts("Guess the number I'm thinking of!".green)
    generateNumber
    promptForInput
  end
end

GuessTheNumber.new.start!




# -----



class GuessTheNumber
end

def generateNumber
  Random.rand(100)
end

def playGuessTheNumber
  number = generateNumber
  guess = nil

  while guess !== number
    puts("Guess the number I'm thinking of!".green)
    guess = promptForGuess

      puts("You got the right number!".yellow)
      exitPrompt
    else
      puts("Guess again!".green)
      promptForInput
    end
  begin
  end while guess !== number
end

def promptForGuess
  computerNumber = generateNumber
  @input = gets.sub(/\n/, '')
  quitToMenu(@input)
  @input.to_i

end

playGuessTheNumber

GuessTheNumber.new
