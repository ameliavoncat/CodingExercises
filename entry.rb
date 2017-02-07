require 'colorize'

puts('Enter'.green + ' NODE'.red + ' or '.green + 'RUBY'.red + '.'.green)
input = gets.upcase.sub(/\n/, '')

if(input === 'NODE')
  exec 'node', './node/node-menu.js'
end

if(input === 'RUBY')
  exec 'ruby', './ruby/ruby-menu.rb'
end
