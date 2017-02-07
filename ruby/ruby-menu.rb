require 'colorize'
require_relative('./constants/menuOptions')

def menuPrompt
  puts('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'.magenta)
  puts("Welcome to Ruby Coding Exercises!".magenta)
  puts('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'.magenta)

  puts('Menu:'.green)
  @menuOptions.each_key { |key| puts(key.to_s.green + ': '.green + @menuOptions[key][:name].green) }

  puts('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'.magenta)
  puts('Enter the number of the program to run or /q to quit.'.magenta)
  puts('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'.magenta)

  getInput
end

def getInput
  input = gets
  if (input.sub(/\n/, '').downcase === '/q')
    puts('Exiting Ruby Coding Exercises Menu.'.red)
    return
  elsif (input.to_i === 1)
    exec 'ruby', 'ruby/exercises/guess-the-number.rb'
  else
    puts('Invalid entry.'.red)
    getInput
  end
end

menuPrompt
