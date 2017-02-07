def menuPrompt
  puts('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
  puts("Welcome to Ruby Coding Exercises")
  puts('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')

  puts('Menu:')
  puts('1: Etc')

  puts('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
  puts('Enter the number of the program to run or /q to quit.')
  puts('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')

  input = gets.to_i
  if(input === 1)
    exec 'ruby', 'ruby/guess-the-number.rb'
  end
end

menuPrompt
