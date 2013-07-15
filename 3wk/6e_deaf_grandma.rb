STDOUT.sync = true
PASS_PHRASE = "HUH?! SPEAK UP, SONNY!"
Fail_Phrase = Proc.new { "NO, NOT SINCE #{rand(1930..1950)}!"}

while 1 do
  print "You: "
  str = gets.chomp
  break if str == 'BYE'
  puts "Grandma: #{str.upcase == str ? Fail_Phrase.call : PASS_PHRASE}"
end

