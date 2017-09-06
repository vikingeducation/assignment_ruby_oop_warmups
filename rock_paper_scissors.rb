class Game
  attr_accessor :qty_players

  def initialize(args)
    @qty_players = args[:qty_players]
  end

  def play
    welcome_player
    p determine_round_winner(player_select_weapon, computer_select_weapon)
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

  def determine_round_winner(player_weapon, computer_weapon)
    if player_weapon == computer_weapon
      return 'tie'
    elsif player_weapon == "r" && computer_weapon == "p"
      return 'computer'
    elsif player_weapon == "p" && computer_weapon == "s"
      return 'computer'
    elsif player_weapon == "s" && computer_weapon == "r"
        return 'computer'
    else
      return 'player'
    end
  end

  def player_select_weapon
    puts "Please select a weapon by entering 'r', 'p', or 's':"
    puts "r: Rock"
    puts "p: Paper"
    puts "s: Scissors"
    gets.chomp.downcase
  end

  def computer_select_weapon
    ['r', 'p', 's'].sample
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