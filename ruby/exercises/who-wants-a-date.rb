require 'colorize'
require 'date'
exitPrompt = require_relative('../helpers/exitPrompt')
quitToMenu = require_relative('../helpers/quitToMenu')

def displayExitPrompt
  exitPrompt
end

@datesArray = []
@parsedDates = []

puts('Enter any key to let the program standardize dates.txt'.green)
input = gets
quitToMenu(input)

dates = File.open('./ruby/constants/dates.txt').each_line {|line|
    date = line.split(/\n/).join.to_s
    @datesArray.push(date)
  }

  @datesArray.each {|date|
    date.gsub!(/\#|\*/, '/' )
    @parsedDates.push(Date._parse(date.to_s, true))
  }

  puts('Standardized Dates File:'.green)
  @parsedDates.each {|date|
    puts(date[:year].to_s.green + '-'.green + date[:mon].to_s.green + '-'.green + date[:mday].to_s.green)
  }
  puts('~~~~~~~~~~'.magenta)
  puts(@parsedDates.size.to_s.yellow + ' dates standardized.'.green)

displayExitPrompt
