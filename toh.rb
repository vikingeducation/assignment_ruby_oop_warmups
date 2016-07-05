require_relative "tower"

class TOH

  def initialize(height)
    @height = height
    @board = [Tower.new(height, true), Tower.new(height), Tower.new(height)]
  end

  def play
    render_board
    until win?
      get_move
      if valid_move?
        change_board
        render_board
      end
    end
  end

  def get_move
    puts "Where would you like to move from?"
    @from_move = gets.chomp.to_i - 1

    puts "Where would you like to move to?"
    @to_move = gets.chomp.to_i - 1
  end

  def valid_move?
    if !@from_move.between?(0,2) || !@to_move.between?(0,2)
      puts "Move not valid. Input a move betwen 1 and 3!"
      return false
    elsif @board[@from_move].tower.all?{ |i| i == nil }
      puts "Move not valid. Choose a tower that has pieces."
      return false
    elsif @board[@to_move].tower.all?{ |i| i == nil } || @board[@from_move].get_top_piece < @board[@to_move].get_top_piece
      puts "moved from #{@from_move+1} to #{@to_move+1}"
      return true
    end
  end

  def win?
    if @board[2].tower == (1..@height).to_a.reverse
      puts "Congrats, you won!"
      return true
    else
      return false
    end
  end

  def change_board
    moving_piece = @board[@from_move].get_top_piece
    @board[@to_move].add(moving_piece)
    @board[@from_move].remove
  end

  def render_board
    puts "Game Board"
    puts "------------"

    render_array = []

    @board.each do |tower_obj|
      render_array << tower_obj.tower.reverse
    end

    render_array.transpose.each do |trans_tower|
      trans_tower.each do |piece|
        if piece
          print "x" * piece + (" " * (1+@height-piece))
        else
          print " " * (@height+1)
        end
      end
      print "\n"
    end
  end
end

