require 'pp'
class PlayfairCipher
  attr_reader :square
  def initialize key = 'Playfair Example'
    @square = make_square key.upcase
  end
  private

  def make_square key
    key = key.scan(/[a-zA-Z]/).concat(('A'..'Z').to_a).map {|a| a == 'J' ? 'I' : a}.uniq

    #OR
    #key.scan(/[a-zA-Z]/).join.concat(('A'..'Z').to_a.join).gsub('J','I').gsub some_awesome_regex_to_remove_duplicate_chars

    [key[0..4], key[5..9], key[10..14], key[15..19], key[20..24]]
  end
end

p = PlayfairCipher.new('I love Ruby.')
pp p.square

print "\n\n"

p = PlayfairCipher.new('')
pp p.square

print "\n\n"

p = PlayfairCipher.new
pp p.square
