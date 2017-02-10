require 'colorize'
require_relative('../constants/scrabbleLetters')
exitPrompt = require_relative('../helpers/exitPrompt')
quitToMenu = require_relative('../helpers/quitToMenu')

@scrabBag = @scrabbleLetters.clone
@remainingLetters = {}
letters = @scrabBag.keys

def reduceLetterCount(letter)
  @scrabBag[letter.to_sym][:count] = @scrabBag[letter.to_sym][:count] -1
end

def getRemainingLetters(letter)
  count = @scrabBag[letter.to_sym][:count]
  if(@remainingLetters.has_key?(count))
    @remainingLetters[count].push(letter)
  else
    @remainingLetters[count] = [letter]
  end
end

def displayExitPrompt
  exitPrompt
end

puts('Enter the tiles that have already been played.'.green)
input = gets
quitToMenu(input)
input.gsub!(/\W|\d/, '')
input = input.upcase.split('')

input.each {|letter| reduceLetterCount(letter) }

letters.each { |letter| getRemainingLetters(letter) }
puts('Letters remaining in the bag:'.green)
@remainingLetters.keys.sort.each {|key| puts(key.to_s.green + ': '.green + @remainingLetters[key].join(', ').yellow)}

displayExitPrompt
