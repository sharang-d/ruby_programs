s = ''
for i in 1..50_000
  s << i.to_s << "\n"
end
str_array = s.split("\n")
count = str_array.length
max_width = count.to_s.length
count.times { |count|  printf "Line %#{max_width}d: #{(str_array[count])}\n" %(count + 1) }
