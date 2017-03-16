require 'colorize'
require_relative('../helpers/exit_prompt')
require_relative('../helpers/quit_to_menu')

class ParensBeGone
  def initialize
    @open_parens = []
    @previous_match = {
      :open => '',
      :close => ''
    }

    start!
  end

  def start!
    string = prompt_for_input
    corrected_string = rebuild_string(string)
    display_corrected_string(corrected_string)
  end

  def prompt_for_input
    puts('Enter an expression to correct.'.green)
    input = gets.chomp
    quit_to_menu(input)

    input
  end

  def rebuild_string(string)
    string = string.split('')
    string.each_index {|index|
      character = string[index]
      check_string_character(string, character, index)
    }

    string.join('')
  end

  def check_string_character(string, character, index)
    if(character === '(')
      @open_parens.push(index)
    elsif(character === ')')
      open_bracket = @open_parens.pop()
      if(open_bracket === @previous_match[:open].to_i - 1 &&
        @previous_match[:close].to_i === index - 1)
        string[open_bracket] = ''
        string[index] = ''
      elsif(open_bracket + 1 === index)
        string[open_bracket] = ''
        string[index] = ''
      end
      @previous_match[:open] = open_bracket
      @previous_match[:close] = index
    end
  end

  def display_corrected_string(string)
    puts('The corrected string is: '.green + string.yellow)
    display_exit_prompt
  end

  def display_exit_prompt
    exit_prompt
  end

  private :rebuild_string, :check_string_character, :prompt_for_input, :display_corrected_string, :display_exit_prompt
end

ParensBeGone.new
