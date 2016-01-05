require './Player.rb'
require './Board.rb'
require './Peg.rb'
require './Disc.rb'

class TowerofHanoi

  def initialize
    @board = Board.new
  end

  #greetings and instructions
  def greetings
    puts "********************************************************"
    puts "Welcome to Tower of Hanoi!".center(55)
    puts "Enter where you would like to move from and to".center(55)
    puts "in the format [1,3]. Enter 'q' to quit.".center(55)
    puts "********************************************************"
  end

  

end