puts('Enter NODE or RUBY.')
input = gets.upcase.sub(/\n/, '')
p(input)

if(input === 'NODE')
  exec 'node', './node/node-menu.js'
end

if(input === 'RUBY')
  exec 'ruby', './ruby/ruby-menu.rb'
end
