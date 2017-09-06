class GameBase
  attr_accessor :computer_score, :player1_score, :player2_score

  def initialize
    @computer_score = 0
    @player1_score = 0
    @player2_score = 0
    @round_winner = ''
  end

  WEAPONS = ['r', 'p', 's']

  private

  def determine_round_winner(player1_weapon, player2_weapon)
    if player1_weapon == player2_weapon
      @round_winner = 'tie'
    elsif player1_weapon == "r" && player2_weapon == "p"
      @round_winner = 'player2'
    elsif player1_weapon == "p" && player2_weapon == "s"
      @round_winner = 'player2'
    elsif player1_weapon == "s" && player2_weapon == "r"
        @round_winner = 'player2'
    else
      @round_winner = 'player1'
    end
  end


  def request_player_choice
    puts "Please select a weapon by entering 'r', 'p', or 's':"
    puts "r: Rock"
    puts "p: Paper"
    puts "s: Scissors"
    gets.chomp.downcase
  end

end

class OnePlayerGame < GameBase

  def play
    puts "Playing against the computer!"
    player1_choice = request_player_choice
    computer_choice = computer_makes_choice
    determine_round_winner(player1_choice, computer_choice)
    announce_round_winner
    award_points
  end

  def computer_makes_choice
    ['r', 'p', 's'].sample
  end

  def announce_round_winner
    if @round_winner == 'player1'
      puts "Player 1 wins!"
    else
      puts "The computer wins!"
    end
  end

  def award_points
    if @round_winner == 'player1'
      @player1_score += 1
    else
      @computer_score += 1
    end
  end

end

class TwoPlayerGame < GameBase

  def play
    puts "Playing against Player 2!"
  end
end
