require 'colorize'
require_relative('../helpers/exit_prompt')
require_relative('../helpers/quit_to_menu')

class TheDisemvowling
  def initialize
    start!
  end

  def start!
    text = prompt_for_input
    display_disemvowled_text(text)
  end

  def prompt_for_input
    puts('Enter the text to disemvowl.'.green)
    input = gets.sub(/\n/, '')
    quit_to_menu(input)

    input.gsub!(/[aeiouAEIOU]|\s/, '')
  end

  def display_disemvowled_text(text)
    puts('The disemvowled text is: '.green + text.to_s.yellow)
    display_exit_prompt
  end

  def display_exit_prompt
    exit_prompt
  end

  private :prompt_for_input, :display_disemvowled_text, :display_exit_prompt
end

TheDisemvowling.new
