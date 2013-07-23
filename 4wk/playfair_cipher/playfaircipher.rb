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

    new_arr = []
    0.upto 4 do |i|
      new_arr[i] = []
      (i * 5).upto ((i * 5) + 4) do |j|
        new_arr[i].push(key[j])
      end
    end
    new_arr
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
