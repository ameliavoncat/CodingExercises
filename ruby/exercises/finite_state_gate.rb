require 'colorize'
require_relative('../helpers/quit_to_menu')

class FiniteStateGate
  def initialize
    @position = 0
    @moving = false
    @previous_direction = :closing
    start!
  end

  def start!
    puts('The gate is closed.'.green)
    start_prompt_thread
    loop do
      change_gate_position
      sleep 1
    end
  end

  def change_gate_position
    case @moving
    when true
      case @previous_direction
      when :closing
        @position -= 1
        if @position === 0
          @moving = false
          puts('The gate is closed.'.green)
        elsif @position === 8
          puts('The gate is starting to close now...'.yellow)
        elsif @position === 5
          puts('The gate is halfway closed now...'.yellow)
        elsif @position === 2
          puts('The gate is almost closed now...'.yellow)
        end
      when :opening
        @position += 1
        if @position === 10
          @moving = false
          puts('The gate is open.'.green)
        elsif @position === 2
          puts('The gate is barely open now...'.yellow)
        elsif @position === 5
          puts('The gate is halfway open now...'.yellow)
        elsif @position === 8
          puts('The gate is almost open now...'.yellow)
        end
      end
    end
  end

  def start_prompt_thread
    @prompt_thread = Thread.new do
      loop do
        input = gets.chomp
        quit_to_menu(input)
        press_button
      end
    end
  end

  def press_button
    puts('Click!'.red)
    puts('The gate button was pressed.'.green)
    @moving = @moving ? false : true
    case @moving
    when true
      @previous_direction = @previous_direction === :closing ? :opening : :closing
      puts('The gate is '.green + @previous_direction.to_s.green + '.'.green)
    when false
      puts('The gate is stopped.'.green)
    end
  end

  private :change_gate_position, :start_prompt_thread, :press_button
end

FiniteStateGate.new
