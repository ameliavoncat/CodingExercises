require 'colorize'

def quitToMenu(input)
  if (input.sub(/\n/, '').downcase === '/q')
    puts("Exiting to Menu.".red)
    exec 'ruby', 'ruby/ruby-menu.rb'
  end
end
