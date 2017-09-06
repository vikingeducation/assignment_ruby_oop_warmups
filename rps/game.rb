class GameBase
  attr_accessor :computer_score, :player1_score, :player2_score, :round_winner, :game_winner, :round_number

  def initialize
    @computer_score = 0
    @player1_score = 0
    @player2_score = 0
    @round_winner = ''
    @game_winner = ''
    @round_number = 1
  end

  WEAPONS = ['r', 'p', 's']

  private

  def announce_round
    puts '-' * 15
    puts "Round #{@round_number}!"
    puts '-' * 15
    @round_number += 1
  end

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
    if @round_winner == 'tie'
      puts "This round was a tie."
    elsif @round_winner == 'player1'
      puts "Player 1 wins the round!"
    else
      puts "The computer wins the round!"
    end
    puts "Current scores: You: #{@player1_score} | Computer: #{@computer_score}"
  end

  def award_points
    if @round_winner == 'tie'
    elsif @round_winner == 'player1'
      @player1_score += 1
    else
      @computer_score += 1
    end
  end

  def announce_game_winner
    if @game_winner == 'tie'
      puts "This game is a tie."
    elsif @game_winner == 'player1'
      puts "Player 1 wins the game!"
    else
      puts "The computer wins the game!"
    end
  end

end

class TwoPlayerGame < GameBase

  def play
    puts "You are playing against Player 2"
    clear_screen
    3.times do
      announce_round
      puts "Player 1:"
      player1_choice = request_player_choice
      puts "Player 2:"
      player2_choice = request_player_choice
      determine_round_winner(player1_choice, player2_choice)
      award_points
      announce_round_winner
    end
    determine_game_winner
    announce_game_winner
  end

  def announce_round_winner
    if @round_winner == 'tie'
      puts "This round is a tie."
    elsif @round_winner == 'player1'
      puts "Player 1 wins!"
    else
      puts "Player 2 wins!"
    end
  end

  def award_points
    if @round_winner == 'player1'
      @player1_score += 1
    else
      @player2_score += 1
    end
  end

end

