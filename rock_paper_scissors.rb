
class Game

  def initialize
    @options = ["rock", "paper", "scissors"]
    @player_1_choice = nil
    @computer_choice = nil
    @winner = nil
    @victory_conditions = [["rock", "scissors"], ["paper", "rock"], ["scissors", "paper"]]
  end

  def print_welcome
    puts "Welcome to the Rock, Paper, Scissors game"
  end

  def print_instructions
    puts "To make a move, type the hand sign you would like to use"
    puts "e.g. \"rock\", \"paper\", \"scissors\""
  end

  def get_player_choice
    player_input = gets.chomp.downcase
    if @options.include?(get_player_input)
      @player_1_choice = player_input
    else
      puts "Please enter either \"rock\", \"paper\", or \"scissors\""
    end
  end

  def check_victory
    if @player_1_choice
  end

  def print_victory
    puts
  end

end