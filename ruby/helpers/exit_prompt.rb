require 'colorize'

def exit_prompt
  puts 'Press any key to return to the menu.'.red
  gets
  exec 'ruby', 'ruby/menu_prompt.rb'
end
