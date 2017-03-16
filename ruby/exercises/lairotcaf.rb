require 'colorize'
require_relative('../helpers/exit_prompt')
require_relative('../helpers/quit_to_menu')

class Lairotcaf
  def initialize

    start!
  end

  def start!
    number = prompt_for_input

    find_nearest_factorial(number)
    display_exit_prompt
  end

  def prompt_for_input
    puts('Enter a number to find its factorial.'.green)
    input = gets.chomp
    quit_to_menu(input)

    input.to_i
  end

  def find_nearest_factorial(number)
    current = 2
    total = 1
    while(number > total)
      total = current * total
      current += 1
    end

    if(number === total)
      factorial = current - 1
      puts(number.to_s.green + ' = '.green + factorial.to_s.yellow + '!'.yellow)
    else
      puts(number.to_s.green + ' has no factorial.'.yellow)
    end
  end

  def display_exit_prompt
    exit_prompt
  end

end

Lairotcaf.new
