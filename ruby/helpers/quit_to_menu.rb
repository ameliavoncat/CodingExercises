require 'colorize'

def quit_to_menu(input)
  if (input.sub(/\n/, '').downcase === '/q')
    puts("Exiting to Menu.".red)
    exec 'ruby', 'ruby/menu_prompt.rb'
  end
end
