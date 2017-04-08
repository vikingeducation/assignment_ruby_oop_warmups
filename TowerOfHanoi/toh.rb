require './game_board'

class Toh
  def initialize(disks = 3)
    @game_disks = disks
    @game_board = GameBoard.new(@game_disks)
  end

  def play
    @game_board.instructions

    loop do
      @game_board.move
      @game_board.render
      if @game_board.won?
        puts "\nYou won!"
        exit
      end
    end
  end
end
