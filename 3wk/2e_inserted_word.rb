file = ARGV[0] || 'raw_files/2e_text.txt'
text = File.open(file) {|f1| f1.read}
text.gsub!(/(^| )word($| )/, '\1inserted word\2')
File.open(file, 'w') {|f1| f1.puts text}
