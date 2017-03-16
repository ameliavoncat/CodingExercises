require 'colorize'
require_relative('../helpers/exit_prompt')
require_relative('../helpers/quit_to_menu')

class GuessTheNumber
  def initialize
    start!
  end

  def start!
    puts("Guess the number I'm thinking of!".green)
    generate_number
    prompt_for_input
  end

  def generate_number
    @computerNumber = Random.rand(100)
  end

  def prompt_for_input
    input = gets.chomp
    quit_to_menu(input)

    if (input.to_i == @computerNumber)
      puts("You guessed the right number!".yellow)
      exit_prompt
    elsif(input.to_i < @computerNumber)
      puts("The number you guessed was too low. Guess again!".green)
      prompt_for_input
    else
      puts("The number you guessed was too high. Guess again!".green)
      prompt_for_input
    end
  end

  private :generate_number, :prompt_for_input
end

GuessTheNumber.new
