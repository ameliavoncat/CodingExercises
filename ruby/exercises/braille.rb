require 'colorize'
require_relative('../constants/braille_key')
require_relative('../helpers/exit_prompt')
require_relative('../helpers/quit_to_menu')

class Braille
  def initialize
    start!
  end

  def start!
    puts('Enter a string of English Braille to translate to standard English letters.'.green)
    input = gets.chomp
    quit_to_menu(input)

    input.gsub!(/[^.Oo]/, '')
    input = input.upcase.split('')

    letters = separate_letters(input)
    translation = fix_caps(translate_letters(letters)).join

    puts('Translation: '.green + translation.yellow)

    display_exit_prompt
  end

  def display_exit_prompt
    exit_prompt
  end

  def separate_letters(array)
    letters_array = []
    count = 1
    index = 0

    while(index < array.length)
      if(count === 6)
        letter = Array.new(array.slice(index - 5, 6))
        letters_array.push(letter)
        count = 0
      end
      count += 1
      index += 1
    end

    return letters_array
  end

  def translate_letters(array)
    translated_array = []

    array.each {|letter_array|
      letter = letter_array.join
      translated_array.push($braille_key.key(letter).to_s)
    }
    return translated_array
  end

  def fix_caps(array)
    caps_indices = []
    array.each_index{|index|
      p(array[index])
      if(array[index] === 'CAPS')
        array[index - 1] = array[index - 1].upcase
        caps_indices.push(index)
      end
    }
    array.reject!{|letter| letter === 'CAPS'}
    return array
  end

end

Braille.new
