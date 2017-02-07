require 'colorize'

def menuPrompt
  puts('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'.magenta)
  puts("Welcome to Ruby Coding Exercises!".magenta)
  puts('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'.magenta)

  puts('Menu:'.green)
  puts('1: Guess The Number'.green)

  puts('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'.magenta)
  puts('Enter the number of the program to run or /q to quit.'.magenta)
  puts('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'.magenta)

  getInput
end

def getInput
  input = gets
  if (input.sub(/\n/, '').downcase === '/q')
    return
  elsif (input.to_i === 1)
    exec 'ruby', 'ruby/exercises/guess-the-number.rb'
  else
    puts('Invalid entry.'.red)
    getInput
  end
end

menuPrompt
