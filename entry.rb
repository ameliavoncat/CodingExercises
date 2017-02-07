require 'colorize'

def languagePrompt
  puts('Enter'.green + ' NODE'.red + ' or '.green + 'RUBY'.red + '.'.green)
  input = gets.upcase.sub(/\n/, '')

  if (input === 'NODE')
    exec 'node', './node/node-menu.js'
  elsif (input === 'RUBY')
    exec 'ruby', './ruby/ruby-menu.rb'
  elsif (input === '/Q')
    puts('Exiting Language Menu.'.red)
    return
  else
    languagePrompt
  end
end

languagePrompt
