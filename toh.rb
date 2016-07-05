class Game

  def initialize(num)
      @difficulty = num
  end

  def get_move
    puts "Where would you like to move your piece?"
    gets.chomp
  end

  def convert_input(user_input)
    split_input = user_input.split(',')
    split_input.map { |num| num.to_i }
  end

  def validate_input(input)
    input.length == 2 && input[0] == (1..3) && input[1] == (1..3)
  end

  def play
    puts "Welcome to the Tower of Hanoi"
    gameboard = Board.new(@difficulty)
    gameboard.display
    loop do
      player_move = convert_input(get_move)
      break if validate_input(player_move)
    end
  end

  def make_move

  end

end

class Board

  def initialize(num)
    @tower_size = num
    @board = [[], [], []]
    @board[0] = (1..@tower_size)
  end

  def display
    p @board
  end

end

Game.new(3).play
