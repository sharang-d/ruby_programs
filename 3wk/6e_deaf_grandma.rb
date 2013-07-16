STDOUT.sync = true
fail_phrase = 'UH?! SPEAK UP, SONNY!'
pass_phrase = Proc.new { "NO, NOT SINCE #{rand(1930..1950)}!"}

while true do
  print "You: "
  str = gets.chomp
  break if str == 'BYE'
  puts "Grandma: #{str.upcase == str ? pass_phrase.call : fail_phrase}"
end

