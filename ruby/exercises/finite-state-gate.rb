require 'colorize'
exitPrompt = require_relative('../helpers/exitPrompt')
quitToMenu = require_relative('../helpers/quitToMenu')

@gate = 'CLOSED'
@timeNow = nil
@endTime = nil
@pausedTime = nil
@previousEndTime = nil

def displayExitPrompt
  exitPrompt
end

def acceptInput
  input = gets.chomp
  if(input)
    quitToMenu(input)
    buttonPress
  end
end

@acceptAsyncInput = Thread.new {
  input = gets.chomp
  if(input)
    quitToMenu(input)
    buttonPress
  end
  # @acceptAsyncInput.join
}

def refreshThread
  @acceptAsyncInput = Thread.new {
    input = gets.chomp
    if(input)
      quitToMenu(input)
      buttonPress
    end
    # @acceptAsyncInput.join
  }
end

def waitForGate
  currentTime = Time.now.to_i
  if(@endTime === nil)
    return
  end
  if(@acceptAsyncInput.alive? === false)
    refreshThread
  end
  @acceptAsyncInput
  while(currentTime < @endTime.to_i)
    currentTime += 1
    puts('tick')
    sleep 1
  end
  if(currentTime >= @endTime.to_i)
    case @gate
      when 'CLOSING'
        @gate = 'CLOSED'
        puts('Gate: '.green + @gate.yellow)
        puts('Enter a key to open, close, or pause.'.green)
        @startTime = nil
        @endTime = nil
        acceptInput
      when 'OPENING'
        @gate = 'OPEN'
        puts('Gate: '.green + @gate.yellow)
        puts('Enter a key to open, close, or pause.'.green)
        @startTime = nil
        @endTime = nil
        acceptInput
    end
  end
end

def buttonPress
  puts('Remote clicked.'.green)
  case @gate
    when 'CLOSED'
      @gate = 'OPENING'
      puts('Gate: '.green + @gate.yellow)
      puts('Enter a key to open, close, or pause.'.green)
      @timeNow = Time.now.to_i
      @endTime = Time.now.to_i + 5
      waitForGate
    when 'OPENING'
      @gate = 'PAUSED WHILE OPENING'
      puts('Gate: '.green + @gate.yellow)
      puts('Enter a key to open, close, or pause.'.green)
      @pausedTime = Time.now.to_i
      @previousEndTime = @endTime
      @endTime = nil
      acceptInput
    when 'PAUSED WHILE OPENING'
      @gate = 'CLOSING'
      puts('Gate: '.green + @gate.yellow)
      puts('Enter a key to open, close, or pause.'.green)
      @endTime = @previousEndTime + (@pausedTime - @timeNow)
      @timeNow = Time.now.to_i
      @pausedTime = nil
      @previousEndTime = nil
      waitForGate
    when 'CLOSING'
      @gate = 'PAUSED WHILE CLOSING'
      puts('Gate: '.green + @gate.yellow)
      puts('Enter a key to open, close, or pause.'.green)
      @pausedTime = Time.now.to_i
      @previousEndTime = @endTime
      @endTime = nil
      acceptInput
    when 'PAUSED WHILE CLOSING'
      @gate = 'OPENING'
      puts('Gate: '.green + @gate.yellow)
      puts('Enter a key to open, close, or pause.'.green)
      @endTime = @previousEndTime + (@pausedTime - @timeNow)
      @timeNow = Time.now.to_i
      @pausedTime = nil
      @previousEndTime = nil
      waitForGate
    when 'OPEN'
      @gate = 'CLOSING'
      puts('Gate: '.green + @gate.yellow)
      puts('Enter a key to open, close, or pause.'.green)
      @timeNow = Time.now.to_i
      @endTime = Time.now.to_i + 5
      waitForGate
  end
end

puts('Gate: '.green + @gate.yellow)
puts('Enter a key to open, close, or pause.'.green)
acceptInput
