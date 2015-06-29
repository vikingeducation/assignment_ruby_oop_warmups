=begin
    - Rock Paper Scissors class - with method "main" which runs the program
    - first class , asking players choice?
    - 2nd class computer choice
    - a method in RockPaperSissors compare the 2 inputs
    - method to return winner
=end

class RockPaperScissors
  def main
    @opponent = SelectOpponent.new

    if @opponent.choice == "1" 
      @player = PlayerChoice.new
      @player2 = ComputerChoice.new
    else 
      @player = PlayerChoice.new
      @player2 = PlayerChoice.new
    end

    winner = compare(@player.choice, @player2.choice)
    arr = ["It's a tie!","Player 1 wins", "Player 2 wins"]

    arr[winner]
  end

  def compare(player, player2)
    puts "The second player picked: #{player2}"
    if (player == player2)
      return 0
    elsif (player == "rock") && (player2 == "paper")
      return 1
    elsif (player == "rock") && (player2 == "scissors")
      return 1
    elsif (player == "paper") && (player2 == "rock")
      return 1
    elsif (player == "paper") && (player2 == "scissors")
      return 2
    elsif (player == "scissors") && (player2 == "rock")
      return 2
    elsif (player == "scissors") && (player2 == "paper")
      return 2
    end
  end
end

class SelectOpponent
  attr_accessor :choice

  def initialize
    puts "Player 2 is : a human (enter: 0) or a computer (enter: 1)"
    @choice = gets.chomp
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

