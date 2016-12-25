require './board'

class TowerOfHanoi
  def initialize(height)
    @board = Board.new(height)
  end

  def play
    puts "Welcome to Tower of Hanoi!"
    puts "Instructions:"
    puts "Enter where you'd like to move from and to"
    puts "in the format '1,3'. Enter 'q' to quit."
    @board.render 
    puts "Enter move >"
    input = gets.chomp
    while input != 'q'
      if valid_input?(input)
        @board.update!(input)
        @board.render
        if @board.win?
          puts "Congratulations, you have won!"
          exit
        else
          puts "Enter move >"
        end
      else
        puts "Invalid input!"
      end
      input = gets.chomp
    end
    puts "Exiting..."
    exit
  end

  def valid_input?(input)
    return false if input.length > 3
    return false if input[1] != ','
    return false if input[0] == input[2]
    return false unless (1..3) === input[0].to_i
    return false unless (1..3) === input[2].to_i 
    return false unless @board.valid_move?(input)
    true
  end

end

# load './towers.rb'
# t = TowerOfHanoi.new(3)
# t.play