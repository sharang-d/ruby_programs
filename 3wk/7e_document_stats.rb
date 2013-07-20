file = ARGV[0] || 'raw_files/text.txt'
text = File.open(file) {|f1| f1.read}
word_count = text.split(/\s/).size
sentence_count = text.split(/\.|\?|!/).delete_if {|s| s.match(/^\n+$/)}.size
character_count = text.length 
non_whitespace_character_count = text.gsub(/\s+/,'').size
paragraph_count = text.scan(/\n\n./).size + 1
line_count = text.each_line.count
puts "File: #{file}
   Character count: #{character_count}
   Character count(excluding whitespace characters): #{non_whitespace_character_count}
   Line count: #{line_count}
   Word count: #{word_count}
   Sentence count: #{sentence_count}
   Paragraph count: #{paragraph_count}
   Average number of words per sentence: %.2f
   Average number of sentences per paragraph: %.2f" %[word_count.to_f/sentence_count,  sentence_count.to_f/paragraph_count]
