old_list = []
new_list = []

f1 = File.open('old-inventory.txt') 
old_list << f1.readline.strip until f1.eof
f1.close

f2 = File.open('new-inventory.txt')
new_list << f2.readline.strip until f2.eof
f2.close 

puts "New files: "
puts new_list.reject {|file_name| old_list.include? file_name}
