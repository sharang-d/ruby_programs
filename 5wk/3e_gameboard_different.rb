class GameBoard

  def initialize
    random_no = rand(5)
    change_locations [random_no, random_no + 1, random_no + 2]
  end

  def check_yourself num
    num = num.to_i
    if @locations.include?(num)
      @guessed << num unless @guessed.include?(num)
      @no_of_hits += 1
      if @locations.all? {|e| @guessed.include?(e)} 
        puts 'End'
        return 'kill' 
      else
        puts 'Hit'
      end
    else
      puts 'Miss'
    end
  end

  def change_locations loc
    @locations = loc
    @guessed = []
    @no_of_hits = 0
  end

  def play
    is_alive = true
    no_of_guesses = 0
    while is_alive
      print 'Enter a number: '
      STDOUT.flush
      user_guess = gets.chomp
      result = check_yourself user_guess
      no_of_guesses += 1
      if result == 'kill'
        is_alive = false
        puts "You took #{no_of_guesses} guesses"
      end
    end
    initialize
  end

end

if __FILE__ == $PROGRAM_NAME
  gb = GameBoard.new
  gb.play
end
