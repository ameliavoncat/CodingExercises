require 'colorize'
require_relative('../helpers/exit_prompt')
require_relative('../helpers/quit_to_menu')


class StringIndices
  def initialize
    start!
  end

  def start!
    string = prompt_for_string
    prompt_for_index(string)
  end

  def prompt_for_string
    puts('Enter a string.'.green)
    string = gets
    quit_to_menu(string)
    string.gsub!(/\n/, '').gsub!(/[^a-zA-Z]/, ' ')
    string = string.split(' ')
  end

  def prompt_for_index (string)
    puts('Enter the non-zero index of the word to find.'.green)
    index = gets.chomp
    quit_to_menu(index)

    if(index.to_i <= 0 || index.to_i > string.length)
      puts("Result: ".green + "''".yellow)
      display_exit_prompt
    else
      puts("Result: ".green + string[index.to_i - 1].yellow)
      display_exit_prompt
    end
  end

  def display_exit_prompt
    exit_prompt
  end

  private :prompt_for_string, :prompt_for_index, :display_exit_prompt
end

StringIndices.new
