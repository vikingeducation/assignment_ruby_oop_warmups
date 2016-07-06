
require_relative 'player.rb'

class Game

  WINNING_COMBINATIONS = { "rock" => "scissors", "paper" => "rock", "scissors" => "paper" }
  OPTIONS = ["rock", "paper", "scissors"]

  def initialize
    @player_1 = Player.new
    @player_2 = nil
    @computer_choice = nil
    @outcome = nil
    @number_of_players
  end

  def print_welcome

    puts "Welcome to the Rock, Paper, Scissors game"

  end

  def print_instructions

    puts "To make a move, type the hand sign you would like to use"

    puts "e.g. \"rock\", \"paper\", \"scissors\""

  end

  def number_of_players

    puts "Enter the number of players (1 - 2): "

    @number_of_players = gets.chomp.to_i

    if @number_of_players != 1 && @number_of_players != 2

      number_of_players

    end

  end

  def get_player_choice(player)

    print "Please enter your choice now: "

    player.make_choice

  end

  def validate_player_choice(player)

    unless OPTIONS.include?(player.choice)

      puts "Please enter either \"rock\", \"paper\", or \"scissors\""

      get_player_choice(player)

    end

  end

  def get_computer_choice

    puts "Player 2 is choosing now"

    @computer_choice = OPTIONS.sample

  end

  def check_outcome(opponent_choice)

    if @player_1.choice == opponent_choice

      @outcome = "Tie"

    elsif WINNING_COMBINATIONS[@player_1.choice] == opponent_choice

      @outcome = "Player 1 wins!"

    else

      @outcome = "Player 2 wins!"

    end

  end

  def print_outcome

    puts @outcome

  end

  def game_loop
    print_welcome
    print_instructions
    number_of_players
    until @outcome
      get_player_choice(@player_1)
      validate_player_choice(@player_1)
      if @number_of_players == 1
        get_computer_choice
        check_outcome(@computer_choice)
      else
        @player_2 = Player.new
        get_player_choice(@player_2)
        validate_player_choice(@player_2)
        check_outcome(@player_2.choice)
      end
      print_outcome
    end
  end

end

game = Game.new

game.game_loop