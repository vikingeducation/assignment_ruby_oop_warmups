#class TOH
  #play
  #win?
  #board
  #board_render
  #move
  #valid_move?

class TOH
  attr_reader :board

  def initialize(height)
    @board = [Tower.new(height, true), Tower.new(height), Tower.new(height)]
  end

  def play
    until win?
      get_move
      if valid_move?
        change_board
        p @board
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
    if @board[@from_move].tower.all?{ |i| i == nil }
      puts "invalid move!"
      return false
    elsif @board[@to_move].tower.all?{ |i| i == nil } || @board[@from_move].get_top_piece < @board[@to_move].get_top_piece
      puts "moved from #{@from_move+1} to #{@to_move+1}"
      return true
    end
  end

  def win?
    
  end

  def change_board
    @board[@to_move].add(@board[@from_move])
    @board[@from_move].remove
    

  end

  def render_board
    puts "Game Board"
    puts "------------"
    @board.transpose.each do |tower|
      tower.each {|spot| spot ? (print "x"*spot) : (print " "*@height)}
      print "\n"
    end

  end
end

class Tower < Array
  attr_reader :tower

  def initialize(height, start = nil)
    @height = height
    start ? start_tower : @tower = [nil] * @height
  end

  def start_tower
    @tower = (1..@height).to_a.reverse
  end

  def get_top_piece
    @num_index = @tower.index(nil) - 1
    @tower[num_index]
  end

  def add(piece)
    nil_index = @tower.index(nil)
    @tower[nil_index] = piece
  end

  def remove
    @tower[@num_index] = nil
  end


end


# game = TOH.new(4)

# game.play
# puts game.board

# game.render_board
