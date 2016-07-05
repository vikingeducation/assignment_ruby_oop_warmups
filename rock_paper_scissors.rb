
class Game

  @@WINNING_COMBINATIONS = { "rock" => "scissors", "paper" => "rock", "scissors" => "paper" }

  def initialize
    @options = ["rock", "paper", "scissors"]
    @player_1_choice = nil
    @computer_choice = nil
    @outcome = nil
  end

  def print_welcome

    puts "Welcome to the Rock, Paper, Scissors game"

  end

  def print_instructions

    puts "To make a move, type the hand sign you would like to use"

    puts "e.g. \"rock\", \"paper\", \"scissors\""

  end

  def get_player_choice

    print "Please enter your choice now: "

    player_input = gets.chomp.downcase

    if @options.include?(player_input)

      @player_1_choice = player_input

    else

      puts "Please enter either \"rock\", \"paper\", or \"scissors\""

      get_player_choice

    end

  end

  def get_computer_choice

    puts "The computer is choosing now"

    @computer_choice = @options.sample

  end

  def check_outcome

    if @player_1_choice == @computer_choice

      @outcome = "Tie"

    elsif @@WINNING_COMBINATIONS[@player_1_choice] == @computer_choice

      @outcome = "Player 1 wins!"

    else

      @outcome = "Computer wins!"

    end

  end

  def print_outcome

    puts @outcome

  end

  def game_loop
    print_welcome
    print_instructions
    until @outcome
      get_player_choice
      get_computer_choice
      check_outcome
      print_outcome
    end
  end

end

game = Game.new

game.game_loop