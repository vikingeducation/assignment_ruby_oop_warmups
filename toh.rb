#class TOH
  #play
  #win?
  #board
  #board_render
  #move
  #valid_move?

class TOH
  def initialize(height)
    @height = height
    @board = Array.new(height,[])
    @board[0] = (0..height).to_a
  end

  def play
    until win?
      get_move
      if valid_move?
        change_board
        render_board
      else
        puts "That was not a valid move"
      end
    end

    puts "Congrats, you won!"

  end

  def get_move
    puts "Where would you like to move from?"
    @from_move = gets.chomp.to_i - 1

    puts "Where would you like to move to?"
    @to_move = gets.chomp.to_i - 1 

    [@from_move, @to_move]   
  end

  def valid_move?
    if !@board[@from_move][0]
      return false
    elsif @board[@to_move].empty? || @board[@from_move][0] < @board[@to_move][0]
      return true
    end
  end

  def win?
    
  end

  def change_board
    moving_piece = @board[@from_move].shift
    @board[@to_move].push(moving_piece)
  end

  def render_board
    puts "Game Board"
    puts "------------"

    @board.each do |tower|
      
    end
    puts "--- " * @height
  end
end