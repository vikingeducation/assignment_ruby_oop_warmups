require_relative 'cli'

class GameBase
  include Cli

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
    puts '','-' * 15
    puts "Round #{@round_number}!"
    puts '-' * 15
    @round_number += 1
  end

  def request_player_choice
    puts "Please select a weapon by entering 'r', 'p', or 's':"
    puts "r: Rock"
    puts "p: Paper"
    puts "s: Scissors"
    response = gets.chomp.downcase
    verify_response(response, WEAPONS)
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

  def announce_round_winner(player2_name, player2_score)
    if @round_winner == 'tie'
      puts "This round was a tie."
    elsif @round_winner == 'player1'
      puts "Player 1 wins the round."
    else
      puts "#{player2_name} wins the round."
    end
    puts "Current scores: Player 1: #{@player1_score} | #{player2_name}: #{player2_score}"
  end

  def determine_game_winner
    if @player1_score == @player2_score
      @game_winner = 'tie'
    elsif @player1_score > @player2_score
      @game_winner = 'player1'
    else
      @game_winner = 'player2'
    end
  end

  def announce_game_winner(player2_name)
    if @game_winner == 'tie'
      puts "This game is a tie."
    elsif @game_winner == 'player1'
      puts "Player 1 wins the game!"
    else
      puts "#{player2_name} wins the game!"
    end
  end

  def announce_game_winner(player2_name)
    if @game_winner == 'tie'
      puts "This game is a tie."
    elsif @game_winner == 'player1'
      puts "Player 1 wins the game!"
    else
      puts "#{player2_name} wins the game!"
    end
  end

  def clear_screen
    Gem.win_platform? ? (system "cls") : (system "clear")
  end

end

class OnePlayerGame < GameBase

  def play
    clear_screen
    puts "You are playing against the Computer."
    3.times do
      announce_round
      puts "Player 1's Turn:"
      player1_choice = request_player_choice
      puts "","The Computer's Turn:"
      computer_choice = computer_makes_choice
      puts "The computer chose: #{computer_choice}"
      determine_round_winner(player1_choice, computer_choice)
      award_points
      announce_round_winner("The Computer", @computer_score)
    end
    determine_game_winner
    announce_game_winner("The Computer")
  end

  def computer_makes_choice
    ['r', 'p', 's'].sample
  end

  def award_points
    if @round_winner == 'tie'
    elsif @round_winner == 'player1'
      @player1_score += 1
    else
      @computer_score += 1
    end
  end

end


class TwoPlayerGame < GameBase

  def play
    clear_screen
    puts "You are playing against Player 2"
    3.times do
      announce_round
      puts "Player 1's Turn:"
      player1_choice = request_player_choice
      puts "","Player 2's Turn:"
      player2_choice = request_player_choice
      determine_round_winner(player1_choice, player2_choice)
      award_points
      announce_round_winner("Player 2", @player2_score)
    end
    determine_game_winner
    announce_game_winner("Player 2")
  end

  def award_points
    if @round_winner == 'tie'
    elsif @round_winner == 'player1'
      @player1_score += 1
    else
      @player2_score += 1
    end
  end
end

