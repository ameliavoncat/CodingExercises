require 'colorize'
require_relative('../constants/scrabble_letters')
require_relative('../helpers/exit_prompt')
require_relative('../helpers/quit_to_menu')

class ScrabBag
  def initialize
    @scrab_bag = $scrabble_letters.clone
    @remaining_letters = {}
    @letters = @scrab_bag.keys
    start!
  end

  def start!
    puts('Enter the letters that have already been played.'.yellow)
    input = gets
    quit_to_menu(input)
    input.gsub!(/\W|\d/, '')
    input = input.upcase.split('')

    input.each { |letter| reduce_letter_count(letter) }
    @letters.each { |letter| get_remaining_letters(letter) }

    puts('Letters remaining in the bag:'.green)
    @remaining_letters.keys.sort.each { |key|
      puts(key.to_s.green + ': '.green + @remaining_letters[key].join(', ').yellow)
    }
    display_exit_prompt
  end

  def reduce_letter_count(letter)
    @scrab_bag[letter.to_sym][:count] = @scrab_bag[letter.to_sym][:count] -1
  end

  def get_remaining_letters(letter)
    count = @scrab_bag[letter.to_sym][:count]
    if(@remaining_letters.has_key?(count))
      @remaining_letters[count].push(letter)
    else
      @remaining_letters[count] = [letter]
    end
  end

  def display_exit_prompt
    exit_prompt
  end

  private :reduce_letter_count, :get_remaining_letters, :display_exit_prompt
end

ScrabBag.new
