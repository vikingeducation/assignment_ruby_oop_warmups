require 'pry'

class Game

  def initialize(num)
      @difficulty = num
      @@player_move = []
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
    input.length == 2 && (1..3).include?(input[0])  && (1..3).include?(input[1])
  end

  def play
    puts "Welcome to the Tower of Hanoi"
    gameboard = Board.new(@difficulty)
    loop do
      gameboard.display
      break if gameboard.done?
      loop do
        loop do
          @player_move = convert_input(get_move)
          break if validate_input(@player_move)
        end
        break if gameboard.make_move(@player_move)
      end
    end
    puts "You won!"
  end


end

class Board

  def initialize(num)
    @tower_size = num
    @board = [[], [], []]
    @board[0] = (1..@tower_size).to_a.reverse
  end

  def display
    p @board
  end

  def make_move(player_move)
    start = @board[(player_move[0]) - 1]
    finish = @board[(player_move[1]) - 1]
    piece = start[-1]
    if piece && (finish.empty? || piece < finish[-1])
      start.pop
      finish.push(piece)
    else
      false
    end
  end

  def done?
    finish_board = [[],[],[]]
    finish_board[2] = (1..@tower_size).to_a.reverse
    @board == finish_board
  end

end

Game.new(3).play
