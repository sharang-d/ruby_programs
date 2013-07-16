STDOUT.sync = true
fail_phrase = 'HUH?! SPEAK UP, SONNY!'
pass_phrase = Proc.new { "NO, NOT SINCE #{rand(1930..1950)}!"}

while !(print "You: ") && (str = gets.chomp) != 'BYE'  do
  puts "Grandma: #{str.upcase == str ? pass_phrase.call : fail_phrase}"
end
