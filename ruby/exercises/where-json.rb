require 'colorize'
require 'json'
exitPrompt = require_relative('../helpers/exitPrompt')
quitToMenu = require_relative('../helpers/quitToMenu')
jsonObject = File.read('./ruby/constants/shakespeare.json')
@match = false

def displayExitPrompt
  exitPrompt
end

def searchArray(array, value, path)
  array.each_index {|index|
    pathCopy = Array.new(path)
    pathCopy.push(index)
    if(array[index].class == Hash)
      searchKeys(array[index], value, pathCopy)
    elsif(array[index].class == Array)
      searchArray[array[index], value, pathCopy]
    elsif(array[index] === value)
      @match = pathCopy
      return pathCopy
    end
  }
end

def searchKeys(hash, value, path)
  hash.keys.each {|key|
    pathCopy = Array.new(path)
    pathCopy.push(key)
    if(hash[key] === value)
      @match = pathCopy
      return pathCopy
    elsif(hash[key].class == Hash)
      searchKeys(hash[key], value, pathCopy)
    elsif(hash[key].class == Array)
      searchArray(hash[key], value, pathCopy)
    end
  }
end

inputHash = JSON.parse(jsonObject)

puts('Enter the value to locate.'.green)
target = gets.sub(/\n/, '')
searchKeys(inputHash, target, [])

if(@match)
  puts(target.to_s.green + ' is located in the JSON at: '.green + @match.join(' -> ').yellow)
else
  puts(target.to_s.green + ' was '.green + 'not found'.yellow + ' in the JSON.'.green)
end

displayExitPrompt
