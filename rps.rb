#######################  ROCK PAPER SCISSORS

class Computer
  attr_accessor :hand

  def initialize
    @hand = ["scissors", "rock", "paper"].sample
  end

end


class Player

  attr_accessor :hand

  def initialize(string)
    @hand = string
  end

end


class Game
  attr_accessor :player

  def initialize
    puts "We're gonna play rock, paper, scissors. Choose your hand:"
    @player = Player.new(gets.chomp)
  end



end

game = Game.new
