def last_modified(file)
  raise "Cannot access #{file}" unless File.exist?(file)
  puts "#{file} was last modified #{(Time.now - File.stat(file).mtime)/(60*60*24)} days ago"
end

if __FILE__ == $0
  last_modified $0
end
