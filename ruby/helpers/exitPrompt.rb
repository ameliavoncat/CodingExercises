require 'colorize'

def exitPrompt
  puts 'Press any key to return to the menu.'.red
  input = gets
  exec 'ruby', 'ruby/ruby-menu.rb'
end
