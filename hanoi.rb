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
  def move(c1, c2)
    @colmap[c2] << @colmap[c1].pop
  end

  def check_win?
    @col3 == @win_condition
  end

  # This method is going to check if the move is legal and valid
  # c1 is origin column, c2 is destination column.
  def validate_input(c1,c2)

    if @colmap[c1].length == 0
      puts "There is nothing to take from Column #{c1}"
      get_input
    elsif @colmap[c1][-1] > @colmap[c2][-1]
      puts "That is an invalid move"
      get_input
    else
      move(c1,c2)
    end
  end

  def get_input()
    c1, c2 = 0
    loop do
      puts "Enter origin column."
      c1 = gets.to_i
      break if (c1 < 4 && c1 > 0)
    end

    loop do
      puts "Enter destination column."
      c2 = gets.to_i
      break if (c2 < 4 && c2 > 0)
    end

    validate_input(c1, c2)



  end

end

# This class is in charge of representing the game state to the player.
class Drawer

  # This class just prints the board state out as arrays.
  def print_board(board)

    board.each do |col|

      p col

    end



  end
end

# This class represents the game as a whole.
# It has its own drawer, move parser, and game state.
class Game

  def initialize(height = 3)

    @drawer = Drawer.new

    @game_state = GameState.new(height)

  end

  # The main game loop is here.
  def play

    while true

      @drawer.print_board(@gamestate.board)

      @gamestate.get_input

      @gamestate.move(current_move)

      if @gamestate.check_win?

        @drawer.print_board(@gamestate.board)

        @drawer.print_win

        break

      end

    end

  end

  def get_input

  end


end


hanoi = Game.new

hanoi.play

