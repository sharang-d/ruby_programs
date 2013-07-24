require './playfaircipher.rb'
STDOUT.sync = true

pfc = PlayfairCipher.new
puts "--Playfair Cipher--"
loop do
  puts '-' * 70
  print "Enter the cipher key(Leave it blank for default/old): "
  k = gets.chomp
  pfc.change_key(k) unless k.strip == ''
  puts "Type e-Message_text to encipher and d-Message_text to decipher"
  puts "Enter Message to cipher: "
  text = gets.chomp
  puts "Enciphered message text:\n#{pfc.encipher(text[2, text.length - 2])}" if text[0,2].casecmp('e-') == 0
  puts "Deciphered message text:\n#{pfc.decipher(text[2, text.length - 2])}" if text[0,2].casecmp('d-') == 0
  print "Continue? (y/n): "
  break if gets.chr.downcase == 'n'
end




