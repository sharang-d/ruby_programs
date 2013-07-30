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
      @locations.all? {|e| @guessed.include?(e)} ? 'kill' : 'Hit'
    else
      'Miss'
    end
  end
end

