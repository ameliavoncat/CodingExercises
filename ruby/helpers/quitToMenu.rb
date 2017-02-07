def quitToMenu(input)
  if (input.sub(/\n/, '').downcase === '/q')
    puts("Exiting to Menu.")
    exec 'ruby', 'ruby/ruby-menu.rb'
  end
end
