STDOUT.sync = true
granny_says = Proc.new do |text|
  text.upcase == text ? "NO, NOT SINCE #{rand(1930..1950)}!" : 'HUH?! SPEAK UP, SONNY!'
end

until print("You: ") || 'BYE' == str = gets.chomp do
  puts granny_says[str]
end
