def sentence_count text
  array = text.scan(/(?:^|\s)('|")(.*)\1.?(?:\s|$)/).flatten
  old_quote = array[0] + array[1] + array[0]
  new_quote = old_quote.gsub(/\.|\?|!/, '')
  text.gsub!(old_quote,new_quote)
  puts text
  text.split(/\.|\?|!/).delete_if {|s| s.match(/^\n+$/)}.size
end

#puts sentence_count "'It’s all over, Mrs. Thingummy!' said the surgeon at last."
puts sentence_count "Drs. Smith and Jones (i.e. Mr. Frank’s doctors) both said, \"Hurrah! A cure has been found!\""
