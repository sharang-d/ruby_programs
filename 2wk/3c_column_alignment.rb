s = ''
for i in 1..100_000
  s << i.to_s << "\n"
end

str_array = s.lines
max_width = str_array.count.to_s.length
str_array.each.with_index(1) { |s, i|  puts "Line %#{max_width}d: #{s}" %i }
