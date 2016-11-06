require_relative 'render'
require_relative 'game'

class HumanPlayer
  attr_accessor :move, :points
  attr_reader :type, :name

  def initialize(type, name)
    @move = ""
    @type = type
    @name = name
    @points = 0
  end

  def get_move
    input = gets.chomp
    print "\r" + ("\e[A\e[K")
    @move = input
  end

end

class ComputerPlayer
  attr_accessor :move, :points
  attr_reader :type, :name

  def initialize(type)
    @move = ""
    @type = type
    @name = "Computer"
    @points = 0
  end

  def get_move
    @move = Game::MOVE_OPTIONS.to_a.sample[0]
  end

end
