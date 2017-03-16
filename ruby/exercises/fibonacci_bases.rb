require 'colorize'
require_relative('../helpers/exit_prompt')
require_relative('../helpers/quit_to_menu')

class FibonacciBases
  def initialize
    @fibonacci_bases = {}
    start!
  end

  def start!
    prompt_for_number
  end

  def prompt_for_number
    puts('Enter a number to convert it to base Fibonacci.'.green)
    input = gets.chomp
    quit_to_menu(input)
    input = input.to_i
    if(input === 0)
      puts('Must enter a number greater than 0.'.red)
      prompt_for_number
    end
    generate_fibonacci_sequence(input)
  end

  def generate_fibonacci_sequence(number)
    closest_fib = find_closest_fibonacci(number, 1, 0)
    @fibonacci_bases[closest_fib.to_s.to_sym] = 1
    result = check_next_closest(number, closest_fib, find_closest_fibonacci(closest_fib, 1, 0))
    result = fill_in_zeros(result)

    base_sequence = []
    result.keys.each {|key| base_sequence.push(result[key])}
    display_result(number, base_sequence.join(''))
  end

  def find_closest_fibonacci(number, current, previous)
    if(number <= current+previous)
      return current
    else
      return find_closest_fibonacci(number, current+previous, current)
    end
  end

  def check_next_closest(number, total, next_closest)
    if(number < (total + next_closest))
      @fibonacci_bases[next_closest.to_s.to_sym] = 0
      return check_next_closest(number, total, find_closest_fibonacci(next_closest, 1, 0))
    elsif(number === total + next_closest)
      @fibonacci_bases[next_closest.to_s.to_sym] = 1
      return @fibonacci_bases
    else
      total = total + next_closest
      @fibonacci_bases[next_closest.to_s.to_sym] = 1
      return check_next_closest(number, total, find_closest_fibonacci(next_closest, 1, 0))
    end
  end

  def fill_in_zeros(hash)
    number = hash.keys[-1].to_s.to_i
    next_fib = find_closest_fibonacci(number, 1, 0).to_s.to_sym
    hash[next_fib] = 0

    if(next_fib.to_s.to_i > 1)
      return fill_in_zeros(hash)
    else
      return hash
    end
  end

  def display_result(number, fibonacci)
    puts(number.to_s.green + "'s Fibonacci Base Sequence is: ".green + fibonacci.yellow)
    display_exit_prompt
  end

  def display_exit_prompt
    exit_prompt
  end

  private :prompt_for_number, :generate_fibonacci_sequence,
    :find_closest_fibonacci,  :check_next_closest, :fill_in_zeros,
    :display_result, :display_exit_prompt
end

FibonacciBases.new
