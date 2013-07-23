require 'pp'
class PlayfairCipher

  attr_reader(:square, :key)

  def initialize k = 'Playfair Example'
    @key = k
    @square = make_square(@key)
    @next_pos = 1
  end

  def change_key k
    @key = k
    @square = make_square @key
  end

  def encipher encipher_this
    encipher_this = pre_encipher encipher_this
    @next_pos = 1
    cipher encipher_this
  end

  def decipher decipher_this
    @next_pos = -1
    cipher decipher_this
  end 

  private
  def cipher text
    result = [] 
    0.step(text.size - 2, 2) do |i|
      pos1 = index_in_square(text[i])
      pos2 = index_in_square(text[i.next])
      result[i, i.next] = case
                          when pos1[0] == pos2[0]
                            [@square[pos1[0]][next_index(pos1[1])], @square[pos2[0]][next_index(pos2[1])]] 
                          when pos1[1] == pos2[1]
                            [@square[next_index(pos1[0])][pos1[1]], @square[next_index(pos2[0])][pos2[1]]]
                          else
                            [@square[pos1[0]][pos2[1]], @square[pos2[0]][pos1[1]]]
                          end
    end
    result.join
  end

  def next_index index
    (index + @next_pos) % 5
  end

  def index_in_square char
    for i in 0..4
      for j in 0..4
        return [i, j] if @square[i][j] == char  
      end
    end
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
  p = PlayfairCipher.new('I love Ruby.')
  pp p.square

  print "\n\n"

  p = PlayfairCipher.new('')
  pp p.square

  print "\n\n"

  p = PlayfairCipher.new
  pp p.square

  str = 'Hide the gold in the tree stump' 
  puts "Original: #{str}"
  enciphered = p.encipher(str) 
  puts "Enciphered: #{enciphered}"
  puts "Deciphered: #{p.decipher(enciphered)}"
end
