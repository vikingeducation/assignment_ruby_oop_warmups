# Bring in the tower class
require_relative 'hanoi_tower'

# Class PlayHanoi which initializes a new game of Tower of Hanoi
class PlayHanoi
  attr_accessor :current_move, :to_tower, :from_tower

  def initialize disks = 3
    @disks = disks
    @towers = HanoiTower.new(@disks)
    start
  end

  def start
    puts "************************************"
    puts "***  Welcome to Tower of Hanoi!  ***"
    puts "************************************"
    puts "Instructions:"
    puts "Enter which tower you'd like to move a disk from and then which tower to move that disk to in the format using integers separated by a comma.  For example:\n Enter move > 1,3\nEnter 'q' to quit. \n\nCurrent Board:"

    # initial rendering of board
    @towers.render

    # kick off the moves
    next_action
  end

  def next_action
    puts "Enter move > "
    action = gets.chomp

    if action == 'q' || action == 'quit'
      quit
    else
      @current_move = action.split(',').map { |tower| tower.to_i }
      move
    end
  end

  def move
    @from_tower = @current_move[0]
    @to_tower = @current_move[1]

    # Repeat move back to user
    puts "Move disk from tower #{@from_tower} to tower #{@to_tower}."

    # Perform move if valid
    if valid_move?
      @towers.addresses[to_tower] << @towers.addresses[from_tower].pop
      @towers.render
      if user_won?
        puts "YOU WON!!"
        quit
      else
        next_action
      end
    else
      puts "I'm sorry, that's not a valid move.  Try again."
      next_action
    end
  end

  def valid_move?
    if @current_move
      if @towers.addresses[@to_tower].empty?
        true
      elsif @towers.addresses[@to_tower].last > @towers.addresses[@from_tower].last
        true
      else
        false
      end
    else
      false
    end
  end

  def user_won?
    @towers.addresses[3] == Array.new(@disks) { |i| @disks - i }
  end

  def quit
    puts "Thank you for playing Tower of Hanoi!  Be sure to rate us in the App Store!"
  end
end

game = PlayHanoi.new
