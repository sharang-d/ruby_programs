STDOUT.sync = true

granny_says = Proc.new do |text|
  text.upcase == text ? "NO, NOT SINCE #{rand(1930..1950)}!" : 'HUH?! SPEAK UP, SONNY!'
end

bye_count = 0
while true do
  print "You: "
  you_say = gets.chomp
  if you_say == 'BYE' 
    bye_count += 1
    you_say.downcase!
  else
    bye_count == 0 || bye_count = 0
  end
  if bye_count < 3 
    puts granny_says[you_say] 
  else
    break              
  end
end
