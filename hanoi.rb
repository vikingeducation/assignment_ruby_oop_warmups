# This class is in charge of maintaining and manipulating the game state.
class GameState

  attr_reader :board

  def initialize(height)

    @height = height

    @col1, @col2, @col3 = (1..height).to_a.reverse, [], []

    @board = [@col1, @col2, @col3]

    @win_condition = (1..height).to_a.reverse

    # This colmap is for easier access to columns.
    @colmap = {1 => @col1, 2 => @col2, 3 => @col3}

  end


  # Takes a valid input and checks if the move is legal.
  # Then, makes a move.
  def move(arr)
    c1 = arr[0]
    c2 = arr[1]
    @colmap[c2] << @colmap[c1].pop
  end

  def check_win?
    @col3 == @win_condition
  end

  # This method is going to check if the move is legal and valid
  # c1 is origin column, c2 is destination column.
  def is_legal?(c1,c2)

    if @colmap[c1].nil? || @colmap[c2].nil?
      return false
    end

    if @colmap[c1].length == 0
      return false
    elsif !@colmap[c2][-1].nil? && @colmap[c1][-1] > @colmap[c2][-1]
      return false
    else
      true
    end
  end

end


class Player

  def get_move
    origin, dest = 0
      loop do
        puts "\nEnter origin column."
        origin = gets.to_i
        break if (origin < 4 && origin > 0)
      end

      loop do
        puts "Enter destination column."
        dest = gets.to_i
        break if (dest < 4 && dest > 0)
      end
    return [origin, dest]
  end
end



# This class is in charge of representing the game state to the player.
class Drawer

  def initialize(gamestate)

    @board = gamestate.board

  end

  # This class just prints the board state out as arrays.
  def print_board

    # board.each do |col|

    #   p col.reverse

    # end



    max_height = @board.max.max

    tabl = "Current Board: \n"
    max_height.downto(0) do |val|
      @board.length.times do |col|
        if @board[col][val]
          tabl += ("o" * @board[col][val])
          tabl += (" " * (max_height + 2 - @board[col][val]))
        else
          tabl += (" " * (max_height + 2))
        end
      end
      tabl += "\n"
    end

    @board.length.times do |i|
      tabl += "#{i+1}"
      tabl += (" " * (max_height + 1))
    end

    print tabl
  end

  def print_win
    puts "\nYou win!"
  end
end

# This class represents the game as a whole.
# It has its own drawer, move parser, and game state.
class Game


  def initialize(height = 3)

    

    @gamestate = GameState.new(height)

    @drawer = Drawer.new(@gamestate)

    @player = Player.new
  end

  # The main game loop is here.
  def play

    while true

      @drawer.print_board

      current_move = [0,0]

      # Loop until we have a valid move
      until move_is_valid?(current_move)
        current_move = @player.get_move
        if !move_is_valid?(current_move)
          puts "Invalid move, please try again."
        else
          break
        end
      end

      @gamestate.move(current_move)

      if @gamestate.check_win?
        @drawer.print_board
        @drawer.print_win
        break
      end

    end

  end

  def move_is_valid?(moves)
    origin = moves[0]
    dest = moves[1]
    @gamestate.is_legal?(origin, dest)
  end


end


puts "Enter a height (difficulty)"

difficulty = gets.chomp.to_i

if difficulty > 0
  hanoi = Game.new(difficulty)
else
  hanoi = Game.new
end

hanoi.play

