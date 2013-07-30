class GameBoard
  def initialize
  end

  def set_locations_cells loc
    @locations = loc
    @guessed = []
  end

  def check_yourself num
    num = num.to_i
    if @locations.include?(num)
      @guessed << num unless @guessed.include?(num)
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
end
