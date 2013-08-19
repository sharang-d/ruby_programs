def repeat_call(command, interval, duration)
  start = Time.now
  until (Time.now - start) > duration 
    system command
    sleep interval
  end
  puts duration
end

repeat_call('cal', 5, 60) 
