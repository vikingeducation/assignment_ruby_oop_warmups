class TowerOfHanoi

  def initialize(towers=3)
    @towers = towers.to_i
  end

  def set_up
    # Set up board as 2D array
    @board = Array.new(@towers, [])
    @board[0] = (1..@towers).to_a
  end

  def play
    # Display instructions
    puts "Welcome to Tower of Hanoi!\n
    Instructions:\n
    Enter in numeric form where you'd like to move.
    Left position is 1, middle position is 2, right position is 3.
    Enter 'q' to quit.\n\n"

    # Set up board, then prompt for move
    set_up
    get_move
  end

  def render
    # Display current board
    render = Array.new(@towers)

    @board.each_with_index do |tower, i|
      render[i] = [" "] * (@towers - tower.length) + tower
    end

    render.transpose.each do |row|
      puts " " + row.join("    ")
    end

    puts "---  " * @towers
    puts " #{(1..@towers).to_a.join("    ")}\n"
  end

  def get_move
    render

    puts "Move from: "
    start_position = gets.chomp
    exit if start_position.downcase == 'q'
    start_position = start_position.to_i

    puts "Move to: "
    end_position = gets.chomp
    exit if end_position.downcase == 'q'
    end_position = end_position.to_i

    # Play move if valid, otherwise get new move
    if valid?(start_position, end_position)
      execute_move(start_position, end_position)
    else
      puts "Invalid move!"
      get_move
    end
  end

  def execute_move(start_position, end_position)
    duplicate_board = @board[end_position].dup
    duplicate_board.unshift(@board[start_position][0])
    @board[end_position] = duplicate_board
    @board[start_position].shift

    if won?
      puts "You win!"
    else
      get_move
    end
  end

  def valid?(start_position, end_position)
    # Invalid moves
    if ( !start_position.between?(0, @towers) || !end_position.between?(0, @towers) || start_position == end_position || start_position > end_position || @board[start_position][0].nil? )
      return false
    else
      return true
    end
  end

  def won?
    return true if @board.last == @board.last.sort && @board.last.length == @towers
  end

end
