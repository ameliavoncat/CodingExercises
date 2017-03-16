require 'colorize'
require_relative('../helpers/exit_prompt')
require_relative('../helpers/quit_to_menu')

class StringPermutations
  def initialize
    @accumulator = []
    start!
  end

  def start!
    puts('Enter a string to see its permutations.'.green)
    input = gets.chomp
    quit_to_menu(input)

    input_array = input.split('')

    input_array = find_unique_characters(input_array)
    get_index_permutations(input_array.size){|result| @accumulator.push(result)}

    result = convert_back_to_string(@accumulator, input_array).join(' ')

    puts('The unique characters in '.green + input.to_s.green + ' have '.green + @accumulator.size.to_s.yellow + ' permutations.'.green)
    puts('Permutations: '.green + result.yellow)

    display_exit_prompt
  end

  def heaps_algorithm(n, array, accumulator)
    if(n == 1)
      accumulator << array.clone
    else
      for i in 0..n
        heaps_algorithm(n-1, array, accumulator)
        j = n.even? ? i : 0
        array[j], array[n-1] = array[n-1], array[j]
      end
    end
  end

  def find_unique_characters(array)
    new_array = []
    array.each {|item|
      if(!new_array.find_index(item))
        new_array.push(item)
      end
    }
    return new_array
  end

  def get_index_permutations(n)
    p = Array.new(n+1){|i| -i}
    s = 1
    loop do
      yield p[1..-1].map(&:abs), s
      k = 0
      for i in 2..n
        k = i if p[i] < 0 and p[i].abs > p[i-1].abs and p[i].abs > p[k].abs
      end
      for i in 1...n
        k = i if p[i] > 0 and p[i].abs > p[i+1].abs and  p[i].abs > p[k].abs
      end
      break if k.zero?
      for i in 1..n
        p[i] *= -1 if p[i].abs > p[k].abs
      end
      i = k + (p[k] <=> 0)
      p[k], p[i] = p[i], p[k]
      s = -s
    end
  end

  def convert_back_to_string(index_array, input_array)
    string_array = []
    index_array.each {|index|
      sub_array = []
      index.each {|subIndex|
        sub_array.push(input_array[subIndex -1])
      }
      string_array.push(sub_array.join)
    }
    return string_array
  end

  def rearrange_items(first, array, baseArray)
    array.push(first)
    return array
  end

  def display_exit_prompt
    exit_prompt
  end

end

StringPermutations.new
