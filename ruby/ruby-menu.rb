require 'colorize'

def menuPrompt
  puts('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'.magenta)
  puts("Welcome to Ruby Coding Exercises!".magenta)
  puts('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'.magenta)

  puts('Menu:'.green)
  puts('1: Etc'.green)

  puts('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'.magenta)
  puts('Enter the number of the program to run or /q to quit.'.magenta)
  puts('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'.magenta)

  input = gets.to_i
  if(input === 1)
    exec 'ruby', 'ruby/exercises/guess-the-number.rb'
  end
end

menuPrompt
