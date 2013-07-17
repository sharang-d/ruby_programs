current_directory_listing = Proc.new do 
  "Displaying current directory listing:\n#{Dir.glob('*').map {|s| '  '.concat(s)}.join("\n")}"
end

#Dir.rmdir('tmp')
path = Dir.getwd
puts "Current Working directoy: #{path}"
puts "Making directory tmp"
Dir.mkdir('tmp')
puts current_directory_listing[]
puts "Changing current directory to tmp"
Dir.chdir('tmp')
puts "Current Working directory: #{Dir.getwd}"
puts "Going back to original directory"
Dir.chdir(path)
puts "Deleting tmp directory"
Dir.rmdir('tmp')
puts current_directory_listing[]
