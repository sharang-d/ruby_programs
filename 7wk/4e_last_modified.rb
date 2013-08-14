def last_modified(file)
  File.exist?(file) && "#{file} was last modified #{(Time.now - File.stat(file).mtime)/(60*60*24)} days ago"
end

if __FILE__ == $PROGRAM_NAME
  puts last_modified( ARGF.argv[0])
end
