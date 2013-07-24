require 'pp'
class PlayfairCipher

  attr_reader(:square, :key, :hash)

  def initialize k = 'Playfair Example'
    change_key k
  end

  def change_key k
    @key = k
    @square = make_square @key
    @hash = make_hash
  end

  def encipher encipher_this
    encipher_this = pre_encipher encipher_this
    cipher encipher_this
  end

  def decipher decipher_this
    cipher(decipher_this, false) 
  end 

  private
  def make_hash
    hash = {}
    temp_sqr = @square.flatten.join
    0.upto 24 do |i|
      pos1 = index_in_square(i)
      0.upto 24 do |j|
        next if i == j
        pos2 = index_in_square(j)
        resulting_diagraph =  case
                              when pos1[0] == pos2[0]
                                [@square[pos1[0]][next_index(pos1[1])], @square[pos2[0]][next_index(pos2[1])]] 
                              when pos1[1] == pos2[1]
                                [@square[next_index(pos1[0])][pos1[1]], @square[next_index(pos2[0])][pos2[1]]]
                              else
                                [@square[pos1[0]][pos2[1]], @square[pos2[0]][pos1[1]]]
                              end 
        hash[temp_sqr[i] << temp_sqr[j]] = resulting_diagraph.join
      end
    end
    hash
  end

  def cipher(text, encode = true)
    digraph_array = text.scan(/../)
    result_array = []
    digraph_array.each do |digraph|
      result_array.push encode ? @hash[digraph] : @hash.key(digraph)
    end
    result_array.join 
  end

  def next_index index
    (index + 1) % 5
  end

  def index_in_square index
    [index / 5, index % 5]
  end

  def prepare_string str
    # Extract only alphabets, upcase and replace J with I
    str.gsub(/[^a-zA-Z]/, '').upcase.gsub('J','I')
  end

  def pre_encipher str
    str = prepare_string str
    result = ''
    x_or_z = 'X'
    str.each_char do |c|
      if result[result.size - 1] == c  && !result.size.even?
        result << x_or_z
        x_or_z = x_or_z == 'X' ? 'Z' : 'X'
      else
        x_or_z == 'X' || x_or_z == 'X'
      end
      result << c
    end
    !result.size.even? ? result << 'X' : result
  end

  def make_square key
    key = prepare_string(key.concat(('A'..'Z').to_a.join)).split(//).uniq
    key << key.shift(5) until key.first.is_a?(Array)
    key
  end

end

if __FILE__ == $PROGRAM_NAME
=begin
  p = PlayfairCipher.new('I love Ruby.')
  pp p.square

  print "\n\n"

  p = PlayfairCipher.new('')
  pp p.square

  print "\n\n"
=end
  p = PlayfairCipher.new
  pp p.square
  p p.hash.sort

  str = 'Hide the gold in the tree stump' 
  puts "Original: #{str}"
  enciphered = p.encipher(str) 
  puts "Enciphered: #{enciphered}"
  puts "Deciphered: #{p.decipher(enciphered)}"
end
