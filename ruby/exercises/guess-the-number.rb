@computerNumber

def generateNumber
  @computerNumber = Random.rand(100)
end

def promptForInput
  @input = gets.to_i
  if (@input == @computerNumber)
    puts("You got the right number!")
    exec 'ruby', 'ruby/ruby-menu.rb'
  else
    puts("Guess again!")
    promptForInput
  end
end

puts("Guess the number I'm thinking of!")
generateNumber
promptForInput
