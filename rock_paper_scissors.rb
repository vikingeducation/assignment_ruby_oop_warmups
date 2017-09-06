class Game
  attr_accessor :qty_players

  def initialize(args)
    @qty_players = args[:qty_players]
  end

  def play
    welcome_player
    play_again_option
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

  def play_again_option
    puts "Play again? Y | N"
    player_response = gets.chomp.upcase
    if player_response == "Y"
      self.play
    elsif player_response == "N"
      puts "Okay Bye."
    else
      puts "I'm sorry, that's not an option."
      play_again_option
    end
  end

end


game = Game.new(qty_players: 1)
game.play