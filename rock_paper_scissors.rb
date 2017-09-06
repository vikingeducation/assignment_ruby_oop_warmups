class Game
  attr_accessor :players

  def initialize(args)
    @players = args[:players]
  end

  def play
    puts self.players
  end
end

game = Game.new(players: 1)
game.play