old_list = IO.readlines('old-inventory.txt')
new_list = IO.readlines('new-inventory.txt')
puts "New files: "
puts new_list.reject {|file_name| old_list.include? file_name}.map {|e| "  #{e}"}
