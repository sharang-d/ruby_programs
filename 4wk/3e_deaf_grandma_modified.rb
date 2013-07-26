STDOUT.sync = true

granny_says = Proc.new do |text|
  'Granny: '.concat(text.upcase == text ? "NO, NOT SINCE #{rand(1930..1950)}!" : 'HUH?! SPEAK UP, SONNY!')
end

bye_count = 0
while bye_count < 3 do
  print "You: "
  you_say = gets.chomp
  if you_say == 'BYE' 
    bye_count += 1
  else
    bye_count = 0
    puts granny_says[you_say] 
  end
end
puts 'Granny: See you later!'
