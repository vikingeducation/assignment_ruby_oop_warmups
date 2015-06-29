=begin
    - Rock Paper Scissors class - with method "main" which runs the program
    - first class , asking players choice?
    - 2nd class computer choice
    - a method in RockPaperSissors compare the 2 inputs
    - method to return winner
=end

class RockPaperScissors
  def main
    @player = PlayerChoice.new
    @computer = ComputerChoice.new
    compare(@player.choice, @computer.choice)
  end

  def compare(player, computer)
    puts "The computer picked: #{computer}"
    if (player == computer)
      puts "tie"
    elsif (player == "rock") && (computer == "paper")
      puts "computer wins"
    elsif (player == "rock") && (computer == "scissors")
      puts "player wins"
    elsif (player == "paper") && (computer == "rock")
      puts "player wins"
    elsif (player == "paper") && (computer == "scissors")
      puts "computer wins"
    elsif (player == "scissors") && (computer == "rock")
      puts "computer wins"
    elsif (player == "scissors") && (computer == "paper")
      puts "computer wins"
    end
  end
end

class PlayerChoice
  attr_accessor :choice
  def initialize
    puts "what is your weapon? (rock, paper, scissors)"
    @choice = gets.chomp
    @choice.downcase!
  end
end

class ComputerChoice
  attr_accessor :choice
  def initialize
    num = rand(3)
    rps = ["rock", "paper" , "scissors"]
    @choice = rps[num]
  end
end

