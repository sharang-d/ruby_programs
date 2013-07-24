require 'pathname'
dir = 'core_ruby@rubylearning'
ARGV[0] && dir = File.join(ARGV[0], dir)
if File.exists?(dir)
  puts "Already exists. Change destination or remove existing folder\nwith name #{dir}.\nExiting."
  exit 1
end
Pathname.new(dir).mkpath
Dir.chdir(dir)
1.upto(7) {|week_number| Dir.mkdir("#{week_number}wk")}
puts "Directory structure created:\n#{dir}\n#{Dir.glob('*').map {|s| " |--#{s}"}.join("\n")}"
