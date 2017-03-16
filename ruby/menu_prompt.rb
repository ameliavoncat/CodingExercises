require 'colorize'
require_relative('./constants/menu_options')

class MenuPrompt
  def initialize
    display_menu_heading
    display_menu_options
    get_input
  end

  def display_menu_heading
    puts('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'.magenta)
    puts('Welcome to Ruby Coding Exercises!'.magenta)
    puts('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'.magenta)
  end

  def display_menu_options
    puts('Menu:'.green)
    $menu_options.each_key { |key|
      puts(key.to_s.green + ': '.green + $menu_options[key][:name].green)
    }
    puts('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'.magenta)
    puts('Enter the number of the program to run or /q to quit.'.magenta)
    puts('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'.magenta)
  end

  def get_input
    input = gets.sub(/\n/, '')
    if (input.downcase === '/q')
      puts('Exiting Ruby Coding Exercises Menu.'.red)
      return
    elsif ($menu_options[input.to_sym] != nil)
      puts('Starting '.magenta + $menu_options[input.to_sym][:name].magenta + '.'.magenta)
      puts('Enter /q to return to the menu.'.magenta)
      exec 'ruby', $menu_options[input.to_sym][:path]
    else
      puts('Invalid entry.'.red)
      get_input
    end
  end

  private :display_menu_heading, :display_menu_options, :get_input
end

MenuPrompt.new
