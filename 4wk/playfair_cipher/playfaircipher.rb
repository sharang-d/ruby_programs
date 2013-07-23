require 'pp'
class PlayfairCipher
  attr_reader :square
  def initialize key = 'Playfair Example'
    @square = make_square key.upcase
  end

  def encrypt encrypt_this
    encrypt_this = pre_encrypt encrypt_this
  end
  private
  def prepare_string str
    # Extract only alphabets, upcase and replace J with I
    str.gsub(/[^a-zA-Z]/, '').upcase.gsub('J','I')
  end

  def pre_encrypt str
    str = prepare_string str
    result = ''
    x_or_z = 'X'
    str.each_char do |c|
      if result[result.size - 1] == c  && !result.size.even?
        result.concat x_or_z
        x_or_z = x_or_z == 'X' ? 'Z' : 'X'
      else
        x_or_z == 'X' || x_or_z == 'X'
      end
      result.concat c
    end
    !result.size.even? ? result << 'X' : result
  end
end

def make_square key
  key = prepare_string(key.concat(('A'..'Z').to_a.join)).split(//).uniq

  #OR
  #key.scan(/[a-zA-Z]/).join.concat(('A'..'Z').to_a.join).gsub('J','I').gsub some_awesome_regex_to_remove_duplicate_chars

  [key[0..4], key[5..9], key[10..14], key[15..19], key[20..24]]
end



p = PlayfairCipher.new('I love Ruby.')
pp p.square

print "\n\n"

p = PlayfairCipher.new('')
pp p.square

print "\n\n"

p = PlayfairCipher.new
pp p.square

p p.encrypt 'Hide the gold in the tree stump'
p p.encrypt 'Congress shall'
