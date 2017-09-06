class Game
  attr_accessor :qty_players

  def initialize(args)
    @qty_players = args[:qty_players]
  end

  def play
    welcome_player
  end

  private

  def welcome_player
    header = "Welcome to Rock, Paper, Scissors!"
    puts "-" * header.length
    puts header
    puts "-" * header.length
    puts "You go head to head against the computer's randomly-selected weapon."
    puts "The winner is the player who won the best out of 3 rounds."
  end

end


game = Game.new(qty_players: 1)
game.play