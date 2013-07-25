require_relative 'playfaircipher'
require 'minitest/autorun'

# these tests expect to be able to access methods square,
# and encipher/decipher ...  modify to match your implementation

class TC_PlayFair < MiniTest::Unit::TestCase
  def test_prepared_squares
    $square_tests.each do |key_phrase, expected_square|
      pf = PlayfairCipher.new key_phrase
      assert_equal expected_square, pf.square
    end
  end

  def test_prepared_enciphers
    $encipher_tests.each do |key_phrase, plain_text, expected_cipher_text|
      assert_equal expected_cipher_text, PlayfairCipher.new(key_phrase).encipher(plain_text)
    end
  end

  def test_prepared_deciphers
    $decipher_tests.each do |key_phrase, cipher_text, expected_plain_text|
      assert_equal expected_plain_text, PlayfairCipher.new(key_phrase).decipher(cipher_text)
    end
  end

end

$square_tests = [
  [ "playfair example", [["P", "L", "A", "Y", "F"], ["I", "R", "E", "X", "M"], ["B", "C", "D", "G", "H"], ["K", "N", "O", "Q", "S"], ["T", "U", "V", "W", "Z"]] ],
  [ "I Love Ruby.", [["I", "L", "O", "V", "E"], ["R", "U", "B", "Y", "A"], ["C", "D", "F", "G", "H"], ["K", "M", "N", "P", "Q"], ["S", "T", "W", "X", "Z"]] ],
  [ "First Amendment", [["F", "I", "R", "S", "T"], ["A", "M", "E", "N", "D"], ["B", "C", "G", "H", "K"], ["L", "O", "P", "Q", "U"], ["V", "W", "X", "Y", "Z"]] ],
  [ "Japan", [["I", "A", "P", "N", "B"], ["C", "D", "E", "F", "G"], ["H", "K", "L", "M", "O"], ["Q", "R", "S", "T", "U"], ["V", "W", "X", "Y", "Z"]] ],
  [ "JapanJest", [["I", "A", "P", "N", "E"], ["S", "T", "B", "C", "D"], ["F", "G", "H", "K", "L"], ["M", "O", "Q", "R", "U"], ["V", "W", "X", "Y", "Z"]] ],
  ['RubyLearning.com', [["R", "U", "B", "Y", "L"], ["E", "A", "N", "I", "G"], ["C", "O", "M", "D", "F"], ["H", "K", "P", "Q", "S"], ["T", "V", "W", "X", "Z"]]]
]

$encipher_tests = [
  [ "playfair example", "Hide the gold in the tree stump", "BMODZBXDNABEKUDMUIXMMOUVIF" ],
  [ "battlestar galactica", "Galactica, this is boomer.  There are four cylon base-stars around the third moon!", "RTETGLSITLMGRSDSPWUFAIGPAIBTIAOWOIKLAQVSBRBILTGRRFPNVNGPBLMGSFFUPO" ],
  [ "playfair example", "japan", "EPLYQR" ],
  ['RubyLearning.com', 'Weeee LOOOOVE Ruuuuby!', "TNITGTGRDVFVDVKUCEYVLVYVBYIY"], 
  [ "First Amendment", "
        Congress shall make no law respecting an establishment of religion, or
        prohibiting the free exercise thereof; or abridging the freedom of speech, or of the press;
        or the right of the people peaceably to assemble, and to petition the government for a
        redress of grievances.", "OWEHEGRYTYNQBVOADBNDPOMVEGRQMGFREHMDNRFDLVRTCNNDIUISAPRCMWMQEXIPCSCFFREHSKAREGGRGRGEOMRNSKGEMPILFEGFTMCREHSKAREGNAWCLIRQGRMGCQIPIFGNXENRIQSFGNSRHKIUIFGNXGPQPAXGMBNMLVZSLMRYRNACPAMDKDPQDRRFMWDSGNCPXASEENDSILFEEGETNRIQRBSRAXMDGMRY" ]
]

$decipher_tests = [
  [ "playfair example", "BMODZBXDNABEKUDMUIXMMOUVIF", "HIDETHEGOLDINTHETREXESTUMP" ],
  [ "First Amendment", "OWEHEGRYTYNQBVOADBNDPOMVEGRQMGFREHMDNRFDLVRTCNNDIUISAPRCMWMQEXIPCSCFFREHSKAREGGRGRGEOMRNSKGEMPILFEGFTMCREHSKAREGNAWCLIRQGRMGCQIPIFGNXENRIQSFGNSRHKIUIFGNXGPQPAXGMBNMLVZSLMRYRNACPAMDKDPQDRRFMWDSGNCPXASEENDSILFEEGETNRIQRBSRAXMDGMRY", "CONGRESXSZSHALLMAKENOLAWRESPECTINGANESTABLISHMENTOFRELIGIONORPROHIBITINGTHEFREEXEXERCISETHEREOFORABRIDGINGTHEFREEDOMOFSPEXECHOROFTHEPRESSORTHERIGHTOFTHEPEOPLEPEACEABLYTOASXSEMBLEANDTOPETITIONTHEGOVERNMENTFORAREDRESSOFGRIEVANCESX" ],
  [ "battlestar galactica", "RTETGLSITLMGRSDSPWUFAIGPAIBTIAOWOIKLAQVSBRBILTGRRFPNVNGPBLMGSFFUPO", "GALACTICATHISISBOXOMERTHEREAREFOURCYLONBASESTARSAROUNDTHETHIRDMOON" ],
  [ "playfair example", "EPLYQR", "IAPANX" ],
  ['RubyLearning.com', "TNITGTGRDVFVDVKUCEYVLVYVBYIY", "WEEXEZELOXOZOXOVERUXUZUXUBYX"],
  ['RubyLearning.com', "ITCEDEHG", "EXERCISE"]
]
