text = File.open('raw_files/text.txt','r') {|f1| f1.read}
#text = gets
words = text.each_line.map {|line_of_text| line_of_text.split(' ').push("\n")}.flatten
new_array = []
words.each_with_index do |word, index|
  if word =~ /^('|")/
    new_array.push(word[0])
    word[0] = ''
  end
  punctuations = word.scan(/(\.|!|\?|:|;|,)?("|')?$/).flatten.compact
  word.gsub!(/(\.|!|\?|:|;|,)?("|')?$/, '')
  new_array.push(word)
  punctuations.each {|p| new_array.push(p)}
end
words = []
new_array.each do |element|
  element =~ /^\.|!|\?|:|;|,|'|"$/ || words.insert(0, element) 
end
new_array.each_with_index do |element, index|
  element =~ /^\.|!|\?|:|;|,|'|"$/ && words.insert(index+1, element) 
end

words.each {|w| printf("%s ",w)}
#p new_array
