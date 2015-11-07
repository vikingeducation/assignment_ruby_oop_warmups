# Bring in the tower and player classes
require_relative 'hanoi_tower'
require_relative 'hanoi_player'

# Class PlayHanoi which initializes a new game of Tower of Hanoi
class PlayHanoi
  attr_accessor :current_move, :to_tower, :from_tower

  def initialize(disks = 3, name = 'Mysterious Ruby')
    @towers = HanoiTower.new(disks)
    @player = Player.new(name, @towers)
    start
  end

  def start
    puts "************************************"
    puts "***  Welcome to Tower of Hanoi!  ***"
    puts "************************************"
    puts "Instructions:"
    puts "Enter which tower you'd like to move a disk from and then which tower to move that disk to in the format using integers separated by a comma.  For example:\n Enter move > 1,3\nEnter 'q' to quit. \n\nCurrent Board:"

    # kick off the moves
    play
  end

  def play
    loop do
      @towers.render
      @player.get_move

      break if game_over?
    end
  end

  def game_over?
    if @towers.winning_board?
      puts "Congrats, #{@player.name}!! You WIN!!!"
      true
    else
      false
    end
  end

  def quit
    puts "Thank you for playing Tower of Hanoi!  Be sure to rate us in the App Store!"
  end
end

game = PlayHanoi.new
