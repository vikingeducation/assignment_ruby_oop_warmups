class Game
  attr_accessor :qty_players

  def initialize(args)
    @qty_players = args[:qty_players]
  end

  def play
    welcome_player
    determine_type_of_game(request_player_count)
    # determine_round_winner(player_select_weapon, computer_select_weapon)
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

  def request_player_count
    puts "How many players? 1 or 2?"
    response = gets.chomp
  end

  def determine_type_of_game(player_count)
    if player_count == "1"
      puts "This is a 1-player game"
    elsif player_count == "2"
      puts "This is a 2-player game"
    else
      while !["1", "2"].include?(player_count)
        puts "I'm sorry, #{player_count} is not an option."
        player_count = request_player_count
      end
    end
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
      exit_game
    else
      puts "I'm sorry, that's not an option."
      play_again_option
    end
  end

  def exit_game
    puts "Okay Bye."
    exit
  end

end


game = Game.new(qty_players: 1)
game.play