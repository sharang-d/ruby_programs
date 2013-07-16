text = ''
File.open('text.txt','r') do |f1|
  text = f1.read
end

text = text.split(/[ \t\r\n\f.,;:!?]/).reverse.delete_if { |s| s.eql?(/['" ]|^$/) }
puts text
