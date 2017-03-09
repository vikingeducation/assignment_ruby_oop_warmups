#class Player
class Player
  attr_accessor :name, :score, :move, :robot

  def initialize(name, robot)
    puts "Player - #{name} : #{robot}"
    @name = name
    @robot = robot
    @score = 0
    @move = ''
  end
end
