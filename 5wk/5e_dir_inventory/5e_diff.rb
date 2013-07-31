new_file = ARGV[1] || 'new-inventory.txt'
old_file = ARGV[0] || 'old-inventory.txt'
old_list = IO.readlines(old_file)
new_list = IO.readlines(new_file)
puts old_list.reject {|file_name| new_list.include? file_name}.map {|e| "- #{e}"}
puts new_list.reject {|file_name| old_list.include? file_name}.map {|e| "+ #{e}"}
