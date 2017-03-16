require 'colorize'
require 'date'
require_relative('../helpers/exit_prompt')
require_relative('../helpers/quit_to_menu')

class WhoWantsADate
  def initialize
    @dates_array = []
    @parsed_dates = []
    start!
  end

  def start!
    prompt_for_input
    display_standardized_dates
    display_exit_prompt
  end

  def prompt_for_input
    puts('Enter any key to let the program standardize dates.txt'.green)
    input = gets.chomp
    quit_to_menu(input)
    parse_dates
  end

  def parse_dates
    File.open('./ruby/constants/dates.txt').each_line {|line|
      date = line.split(/\n/).join.to_s
      @dates_array.push(date)
    }

    @dates_array.each {|date|
      date.gsub!(/\#|\*/, '/' )
      @parsed_dates.push(Date._parse(date.to_s, true))
    }
  end

  def display_standardized_dates
    puts('Standardized Dates File:'.green)
    @parsed_dates.each {|date|
      puts(date[:year].to_s.green + '-'.green + date[:mon].to_s.green + '-'.green + date[:mday].to_s.green)
    }
    puts('~~~~~~~~~~'.magenta)
    puts(@parsed_dates.size.to_s.yellow + ' of '.green + @dates_array.size.to_s.yellow + ' dates standardized.'.green)
  end

  def display_exit_prompt
    exit_prompt
  end

  private :prompt_for_input, :parse_dates, :display_standardized_dates, :display_exit_prompt
end

WhoWantsADate.new
