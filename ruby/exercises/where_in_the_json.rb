require 'colorize'
require 'json'
require_relative('../helpers/exit_prompt')
require_relative('../helpers/quit_to_menu')

class WhereInTheJSON
  def initialize(json)
    @match_path = false
    @parsedJSON = JSON.parse(json)
    start!
  end

  def start!
    puts('Enter the value to locate.'.green)
    target = gets.sub(/\n/, '')
    find_match(target)
  end

  def find_match(target)
    search_keys(@parsedJSON, target, [])

    if(@match_path)
      clean_up_indices
      puts(target.to_s.green + ' is located in the JSON at: '.green +
        @match_path.join(' -> ').yellow)
    else
      puts(target.to_s.green + ' was '.green + 'not found'.yellow +
        ' in the JSON.'.green)
    end
    display_exit_prompt
  end

  def clean_up_indices
    @match_path.each_index { |index|
      if @match_path[index].is_a? Numeric
        @match_path[index] = 'array index: ' + @match_path[index].to_s
      end
    }
  end

  def search_keys(hash, value, path)
    hash.keys.each {|key|
      path_copy = Array.new(path)
      path_copy.push(key)
      if(hash[key] === value)
        @match_path = path_copy
        return path_copy
      elsif(hash[key].class == Hash)
        search_keys(hash[key], value, path_copy)
      elsif(hash[key].class == Array)
        search_array(hash[key], value, path_copy)
      end
    }
  end

  def search_array(array, value, path)
    array.each_index {|index|
      path_copy = Array.new(path)
      path_copy.push(index)
      if(array[index].class == Hash)
        search_keys(array[index], value, path_copy)
      elsif(array[index].class == Array)
        search_array[array[index], value, path_copy]
      elsif(array[index] === value)
        @match_path = path_copy
        return path_copy
      end
    }
  end

  def display_exit_prompt
    exit_prompt
  end

  private :find_match, :clean_up_indices, :search_keys, :search_array, :display_exit_prompt

end

jsonObject = File.read('./ruby/constants/shakespeare.json')
WhereInTheJSON.new(jsonObject)
