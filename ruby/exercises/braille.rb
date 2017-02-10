require 'colorize'
require_relative('../constants/brailleKey')
exitPrompt = require_relative('../helpers/exitPrompt')
quitToMenu = require_relative('../helpers/quitToMenu')

def displayExitPrompt
  exitPrompt
end

def separateLetters(array)
  lettersArray = []
  count = 1
  index = 0

  while(index < array.length)
    if(count === 6)
      letter = Array.new(array.slice(index - 5, 6))
      lettersArray.push(letter)
      count = 0
    end
    count += 1
    index += 1
  end

  return lettersArray
end

def translateLetters(array)
  translatedArray = []

  array.each {|letterArray|
    letter = letterArray.join
    translatedArray.push(@brailleKey.key(letter).to_s)
  }
  return translatedArray
end

def fixCaps(array)
  capsIndices = []
  array.each_index{|index|
    p(array[index])
    if(array[index] === 'CAPS')
      array[index - 1] = array[index - 1].upcase
      capsIndices.push(index)
    end
  }
  array.reject!{|letter| letter === 'CAPS'}
  return array
end

puts('Enter a string of English Braille to translate to standard English letters.'.green)
input = gets.chomp
quitToMenu(input)

input.gsub!(/[^.O]/, '')
input = input.split('')

letters = separateLetters(input)
translation = fixCaps(translateLetters(letters)).join

puts('Translation: '.green + translation.yellow)

displayExitPrompt
